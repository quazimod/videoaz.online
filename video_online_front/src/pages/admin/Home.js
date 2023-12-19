/* eslint-disable react/prop-types */
import axios from 'axios'
import React, { useState, useEffect } from 'react'
import { FormattedMessage, useIntl } from 'react-intl'
import { NotificationManager } from 'react-notifications'
import { Link, useNavigate } from 'react-router-dom'
import { API_URL, AWS_BUCKET_URL, DOMAIN } from '../../config/config'
import './Home.css'

export default function Home({ setAdminAuthed, adminAuthed }) {
  const [showVideoManager, setShowVideoManager] = useState(false)
  const [videos, setVideos] = useState([])
  const [origVideos, setOrigVideos] = useState(videos)
  const [updatedVideos, setUpdatedVideos] = useState({ videos: [], previews: []})
  const [needUpdate, setNeedUpdate] = useState(false)
  const [haveUpdates, setHaveUpdates] = useState(false)
  const [loading, setLoading] = useState(false)
  const [pageSettings, setPageSettings] = useState({ pageNum: 1, itemsPerPage: 10, lastPageIndex: 0, firstItemIndex: 0, count: 0, noMoreData: false })
  const [fullSizePreview, setFullSizePreview] = useState({ show: false, src: '' })
  const [previewHash, setPreviewHash] = useState('?' + new Date().getTime())
  const [btnMenuScrolled, setBtnMenuScrolled] = useState(false)
  const [filter, setFilter] = useState('')

  const intl = useIntl(),
    navigate = useNavigate(),
    { pageNum, itemsPerPage, lastPageIndex, firstItemIndex, lastItemIndex, noMoreData, count } = pageSettings

  useEffect(() => {
    const showFixedOnScroll = () => {
      const btnMenu = document.querySelector('.top-btn-menu')
      const elRect = btnMenu.getBoundingClientRect()

      if (elRect.bottom < 0)
        setBtnMenuScrolled(true)
      else if (window.scrollY <= 200)
        setBtnMenuScrolled(false)
    }

    document.addEventListener('scroll', showFixedOnScroll)
  }, [])

  useEffect(() => {
    if (!adminAuthed)
      navigate('/admin/login')

    const loadVideos = async () => {
      setLoading(true)
      axios.get(`${ API_URL }/videos/all/${ pageNum }?filter=${ filter }&itemsPerPage=${ itemsPerPage }&allResults=true&domain=${ DOMAIN }`)
        .then(res => {
          if (res.data) {
            const { videos, noMoreData, lastPageIndex, firstItemIndex, lastItemIndex, count } = res.data

            setVideos(videos)
            setOrigVideos(videos)
            setPageSettings({ ...pageSettings, lastPageIndex, firstItemIndex, lastItemIndex, noMoreData, count })
            setLoading(false)
          }
        })
        .catch(err => {
          console.error(err)
          NotificationManager.error(intl.formatMessage({ id: 'serverError' }))
        })
    }

    loadVideos()
  }, [pageNum, itemsPerPage, filter])

  const changeVideo = (newValue, prop, index, forceUpdate = false) => {
    const newVideo = {
      ...videos[index],
      [prop]: newValue,
    }

    setVideos(old => old.map((v, i) => i === index ? newVideo : v ))
    setNeedUpdate(true)

    if (forceUpdate)
      updateVideo(newVideo, true)
  }

  const updateVideo = (newVideo, forceUpdate = false) => {
    if (needUpdate || forceUpdate) {
      setUpdatedVideos(old => ({
        videos: old.videos.filter(v => v.id !== newVideo.id ).concat(newVideo),
        previews: old.previews
      }))
      setHaveUpdates(true)
      setNeedUpdate(false)
    }
  }

  const updatePreview = (file, videoId) => {
    const newPreview = {
      videoId,
      preview: file,
    }

    setUpdatedVideos(old => ({
      previews: old.previews.filter(v => v.videoId !== videoId ).concat(newPreview),
      videos: old.videos
    }))
    setHaveUpdates(true)
  }

  const submitUpdates = () => {
    const { videos: updVideos, previews } = updatedVideos

    new Promise((success, fail) => {
      setLoading(true)

      if (updVideos.length) {
        axios.post(`${ API_URL }/admin/manager/updateVideos`, { videos: updVideos, domain: DOMAIN }, {
          headers: {
            'Content-Type': 'application/json;charset=UTF-8'
          },
          withCredentials: true
        })
          .then(res => {
            if (res.data.not_authorized) {
              NotificationManager.error('Требуется повторная авторизация')
              goToLogin()
              fail()
            }

            res.data.error && fail(res.data.error)
            !previews.length && success()
          })
          .catch(err => {
            fail(err)
          })
      }

      if (previews.length) {
        previews.forEach((prev , i) => {
          const data = new FormData()
          data.append('videoId', prev.videoId)
          data.append('preview', prev.preview)

          axios.post(`${ API_URL }/admin/manager/updateVideoPreview`, data, {
            headers: {
              'Content-Type': 'multipart/form-data;charset=UTF-8'
            },
            withCredentials: true
          })
            .then(res => {
              if (res.data.not_authorized) {
                NotificationManager.error('Требуется повторная авторизация')
                goToLogin()
                fail()
              }

              res.data.error && fail(res.data.error)

              if (i + 1 === previews.length) {
                setPreviewHash('?' + new Date().getTime())
                success()
              }
            })
            .catch(err => {
              fail(err)
            })
        })
      }
    })
      .then(() => {
        NotificationManager.success('Изменения успешно сохранены.')
        setOrigVideos(videos)
        resetUpdates()
      })
      .catch(err => {
        console.error(err)
        NotificationManager.error(intl.formatMessage({ id: 'serverError' }))
        setLoading(false)
      })
  }

  const resetChanges = () => {
    setVideos(origVideos)
    resetUpdates()
  }

  const resetUpdates = () => {
    setUpdatedVideos({ videos: [], previews: []})
    setHaveUpdates(false)
    setLoading(false)
    clearFileInputs()
  }

  const goBack = () => { setPageSettings({ ...pageSettings, pageNum: pageNum - 1 }); resetChanges() }
  const goForward = () => { setPageSettings({ ...pageSettings, pageNum: pageNum + 1 }); resetChanges() }
  const goToStart = () => { setPageSettings({ ...pageSettings, pageNum: 1 }); resetChanges() }
  const goToEnd = () => { setPageSettings({ ...pageSettings, pageNum: lastPageIndex }) ; resetChanges() }

  const setItemsPerPage = e => {
    setPageSettings({ ...pageSettings, itemsPerPage: e.target.value, pageNum: 1 })
  }

  const toogleFullSizePreview = (e) => {
    setFullSizePreview(old => ({ show: !old.show, src: e.target.src || '' }))
  }

  const backToHomePage = () => {
    haveUpdates && resetChanges()
    setPageSettings({ ...pageSettings, pageNum: 1 })
    setShowVideoManager(false)
  }

  const doLogout = () => {
    axios.post(`${ API_URL }/admin/logout`, {},
      {
        withCredentials: true,
      })
      .then(res => {
        if (res.data.ok)
          goToLogin()
        else
          NotificationManager.error(res.data.error)
      })
      .catch(() => NotificationManager.error(intl.formatMessage({ id: 'serverError' })))

  }

  const clearFileInputs = () => {
    document.querySelectorAll('.preview-selector').forEach(file => file.value = null)
  }

  const goToLogin = () => {
    setAdminAuthed(false)
    navigate('/admin/login')
  }

  const changeFilterVal = (e) => {
    const { value } = e.target

    if (value.length >= 2 || !value) {
      setFilter(value)
      setPageSettings({ ...pageSettings, pageNum: 1 })
    }
  }

  if (showVideoManager) {
    return (
      <div className="admin-video-manager">
        <fieldset>
          <legend>Менеджер видео</legend>
          <div className={ `top-btn-menu ${ btnMenuScrolled ? 'fixed' : ''}` }>
            <button onClick={ backToHomePage }>Вернуться</button>
            { haveUpdates && <button onClick={ submitUpdates }>Применить изменения</button> }
            { haveUpdates && <button onClick={ resetChanges }>Отменить изменения</button> }
            { loading && <div className='loading'>Идет обработка данных. Подождите...</div> }
          </div>

          <ul className='page-nav-top'>
            { pageNum > 1 && <li><a href='#' onClick={ goToStart }>В начало</a></li> }
            { pageNum > 1 && <li><a href='#' onClick={ goBack }>Назад</a></li> }
            { !noMoreData && <li><a href='#' onClick={ goForward }>Вперед</a></li> }
            { !noMoreData && <li><a href='#' onClick={ goToEnd }>В конец</a></li> }
          </ul>
          <select onChange={ setItemsPerPage } value={ itemsPerPage }>
            <option value={ count }>Все</option>
            <option value="10">Показывать 10</option>
            <option value="25">Показывать 25</option>
            <option value="50">Показывать 50</option>
          </select>
          <span className='results-count'>{ firstItemIndex }-{ lastItemIndex } из { count }</span>

          <input className='filter' placeholder='Искать по ID, названию и тэгам' onChange={ changeFilterVal } />
          { videos.length
            ?
            <table>
              <thead>
                <tr>
                  <th>#</th>
                  <th>ID видео</th>
                  <th>Название видео</th>
                  <th>Лайки</th>
                  <th>Тэги</th>
                  <th>Показывать на текущем портале?({ DOMAIN })</th>
                  <th>Превью</th>
                </tr>
              </thead>
              <tbody>
                {
                  videos.map((video, i) =>
                    <tr key={ i }>
                      <td>{ firstItemIndex + i }</td>
                      <td><Link to={ `/video/${ video.id }` } target="_blank">{ video.id }</Link></td>
                      <td><input type="text" value={ video.title } onChange={ e => changeVideo(e.target.value, 'title', i) } onBlur={ () => updateVideo(video) } /></td>
                      <td><input type="text" value={ video.likes_count } onChange={ e => changeVideo(e.target.value, 'likes_count', i) } onBlur={ () => updateVideo(video) } /></td>
                      <td><textarea value={ video.tags } onChange={ e => changeVideo(e.target.value, 'tags', i) } onBlur={ () => updateVideo(video) } /></td>
                      <td><input type="checkbox" checked={ video.show } onChange={ e => changeVideo(e.target.checked, 'show', i, true) } /></td>
                      <td>
                        <img
                          src={ `${ AWS_BUCKET_URL }/videos/main/${ video.id }/images/poster.webp` + previewHash }
                          alt={ video.title }
                          className="preview-image-thumb"
                          onClick={ toogleFullSizePreview }
                        />
                        <input type="file" className='preview-selector' onChange={ e => updatePreview(e.target.files[0], video.id) } accept=".png, .jpg, .jpeg"/>
                      </td>
                    </tr>
                  )
                }
              </tbody>
            </table>
            :
            <>
              <p className='search-result'>
                <FormattedMessage id='noResults' />
              </p>
            </>
          }

          <ul className='page-nav'>
            { pageNum > 1 && <li><a href='#' onClick={ goToStart }>В начало</a></li> }
            { pageNum > 1 && <li><a href='#' onClick={ goBack }>Назад</a></li> }
            { !noMoreData && <li><a href='#' onClick={ goForward }>Вперед</a></li> }
            { !noMoreData && <li><a href='#' onClick={ goToEnd }>В конец</a></li> }
          </ul>
          <select onChange={ setItemsPerPage } value={ itemsPerPage }>
            <option value={ count }>Все</option>
            <option value="10">Показывать 10</option>
            <option value="25">Показывать 25</option>
            <option value="50">Показывать 50</option>
          </select>
          <span className='results-count'>{ firstItemIndex }-{ lastItemIndex } из { count }</span>

          { fullSizePreview.show
            &&
            <div className='fullsize-preview-box' onClick={ toogleFullSizePreview }>
              <img src={ fullSizePreview.src } />
            </div>
          }
        </fieldset>
      </div>
    )
  }

  return (
    <div className="admin-home-page">
      <fieldset>
        <legend>Админ</legend>
        <button onClick={ () => setShowVideoManager(true) }>Менеджер видео</button>
        <button onClick={ doLogout }>Выйти</button>
      </fieldset>
    </div>
  )
}