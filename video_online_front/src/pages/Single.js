/* eslint-disable react/prop-types */
import axios from 'axios'
import React, { useEffect, useRef, useState } from 'react'
import { Link, useParams } from 'react-router-dom'
import { API_URL, AWS_BUCKET_URL, DOMAIN } from '../config/config'
import Lightbox from '../components/Lightbox'
import PopularVideos from '../components/PopularVideos'
import { NotificationManager } from 'react-notifications'
import { FormattedMessage } from 'react-intl'

export default function Single({ isAuthed, setShowLogin }) {
  const [singleVideo, setSingleVideo] = useState()
  const params = useParams()
  const lboxRef = useRef()

  useEffect(() => {
    window.scrollTo({ top: 0 })

    axios.get(`${ API_URL }/videos/${ params.id }?domain=${ DOMAIN }`)
      .then(res => {
        if (res.data)
          setSingleVideo(res.data)
      })
      .catch(err => {
        console.error(err)
        NotificationManager.error('Произошла ошибка при обращении к серверу. Повторите попытку позднее')
      })
  }, [params.id])

  if (singleVideo) {
    let galleryImages = []
    for (let i = 1; i <= 4; i++) {
      const imageURL =  `${ AWS_BUCKET_URL }/videos/main/${ singleVideo.id }/images/${ i }.webp`
      galleryImages.push(imageURL)
      //if (i < 4) {
      //  galleryImages.push(imageURL)
      /* } else {
        galleryImages.push(
          <a
            key={ i }
            className="last-gallery-item"
            href={ imageURL }
            data-src="#"
            data-download-url="false"
          >
            <div>
              <img src={ imageURL } alt="" />
              <span>
                          Смотреть все
                <br />
                { i } фото
              </span>
            </div>
          </a>
        )
      } */
    }

    return(
      <>
        <div className="video-play-content">
          <div className="container">
            {/* <h2 className="mobile-content">
              <span className="light">{ singleVideo.title }</span>
            </h2> */}
            <div className="row">
              <div className="col-lg-8">
                { isAuthed ?
                  <div className="video-window">
                    <div
                      id="kt_player"
                      style={ {
                        visibility: 'visible',
                        width: 760,
                        height: 427,
                        overflow: 'hidden',
                        position: 'relative',
                        background: 'rgb(0, 0, 0)'
                      } }
                      data-flowplayer-instance-id="0"
                    >
                      <video
                        id="kt_player_internal"
                        src={ `${ AWS_BUCKET_URL }/videos/main/${ singleVideo.id }/${ singleVideo.id }_hd.mp4` }
                        poster={ `${ AWS_BUCKET_URL }/videos/main/${ singleVideo.id }/images/poster.webp` }
                        controls
                        controlsList="nodownload"
                        // eslint-disable-next-line react/no-unknown-property
                        no-controls="true" autoPlay loop playsInline muted
                        style={ { width: 760, height: 427 } }
                      />
                    </div>
                  </div>
                  :
                  <div className="video-window" style={ { background: 'black' } }>
                    <p className='guest-message'>
                      <a href="#" onClick={ setShowLogin }>
                        <FormattedMessage id="needAuthToWatch" />
                      </a>
                    </p>
                  </div>
                }
                <div className="undervideo-galerry" id="undervideo-galerry">
                  <Lightbox items={ galleryImages } ref={ lboxRef } />
                  { galleryImages.map((img, i) =>
                    <a
                      key={ i }
                      className="gallery-item"
                      onClick={ () => {
                        isAuthed ? lboxRef.current.openLightboxOnSlide(i + 1)
                          : setShowLogin(true)
                      } }
                    >
                      <div>
                        <img className="img-responsive" src={ img } alt="" />
                      </div>
                    </a>) }
                </div>
                <div className="col-xs-12 undervideo-txt">
                  <span className="light"></span>
                </div>
              </div>
              <div className="col-lg-4">
                <div className="video-detail">
                  <h5 className="desktop-content">
                    <span className="light">{ singleVideo.title }</span>
                  </h5>
                  <div className="description">
                    {/* { singleVideo.description } */}
                    <div className="video-tags" style={ { height: 'auto' } }>
                      { singleVideo.tags.split(', ').map((tag, i) => (
                        <Link
                          key={ i }
                          to={ isAuthed ? `/videos/tags/${ tag }/` : '#' }
                          onClick={ () => !isAuthed && setShowLogin(true) }
                          className="light">
                          { tag }
                        </Link>
                      ))
                      }
                    </div>
                  </div>
                </div>
                { isAuthed
                  &&
                    <>
                      <div className='download-box_before' style={ {
                        position: 'relative',
                        fontSize: '20px',
                        fontWeight: 700,
                        background: '#111b23',
                        color: '#fff',
                        display: 'inline-block',
                        lineHeight: '12px',
                        padding: '0 15px',
                        zIndex: 1
                      } } >
                        <FormattedMessage id='download' />
                      </div>
                      <div className="download-box">
                        <div className="header-download">
                          <a href={ `${ AWS_BUCKET_URL }/videos/main/${ singleVideo.id }/${ singleVideo.id }_fullhd.mp4` } download>
                            <div className="download-icon">
                              <div>FULL HD</div>
                              <div>1080p</div>
                            </div>
                            <img src="#" alt="" />
                            <span>FULL HD - 1920x1080</span>
                          </a>
                          <a href={ `${ AWS_BUCKET_URL }/videos/main/${ singleVideo.id }/${ singleVideo.id }_hd.mp4` } download>
                            <div className="download-icon">
                              <div>HD</div>
                              <div>720p</div>
                            </div>
                            <img src="#" alt="" />
                            <span>HD - 1280x720</span>
                          </a>
                          <a href={ `${ AWS_BUCKET_URL }/videos/main/${ singleVideo.id }/${ singleVideo.id }_sd.mp4` } download>
                            <div className="download-icon">
                              <div>SD</div>
                              <div>480p</div>
                            </div>
                            <img src="#" alt="" />
                            <span>SD - 1024x576</span>
                          </a>
                        </div>
                      </div>
                    </>
                }
              </div>
            </div>
          </div>
        </div>
        <PopularVideos isAuthed={ isAuthed } setShowLogin={ setShowLogin } />
      </>
    )
  }

  return (
    <>
      <p className='search-result'>
        <FormattedMessage id='noResults' />
      </p>
    </>
  )

}