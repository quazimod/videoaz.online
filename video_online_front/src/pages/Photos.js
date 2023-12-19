/* eslint-disable react/prop-types */
import React, { useEffect, useState } from 'react'
import axios from 'axios'
import { API_URL, AWS_BUCKET_URL, DOMAIN } from '../config/config'
import PhotoGallery from '../components/PhotoGallery'
import { Link, useParams } from 'react-router-dom'
import { NotificationManager } from 'react-notifications'
import { FormattedMessage, useIntl } from 'react-intl'

export default function Photos ({ isAuthed, setShowLogin }) {
  const [photos, setPhotos] = useState([])
  const [loading, setLoading] = useState(true)
  const [noData, setNoData] = useState(false)

  const params = useParams()
  const intl = useIntl()

  useEffect(() => {
    axios.get(`${ API_URL }/videos/all/${ params.pageNum }?domain=${ DOMAIN }`)
      .then(res => {
        if (res.data) {
          let photosArr = []
          res.data.videos.forEach((video) => {
            for (let i = 1; i <= 4; i++) {
              let imgPath = `${ AWS_BUCKET_URL }/videos/main/${ video.id }/images/${ i }.webp`
              photosArr.push({ imgPath })
            }
          })

          setPhotos(photos.concat(photosArr))
          setLoading(false)
          setNoData(res.data.noMoreData)
        }
      })
      .catch(err => {
        console.error(err)
        NotificationManager.error(intl.formatMessage({ id: 'serverError' }))
      })
  }, [params.pageNum])

  if (photos.length)
    return (
      <div className='photos-page'>
        <PhotoGallery
          photos={ photos }
          title={ intl.formatMessage({ id: 'allPhotos' }) }
          isAuthed={ isAuthed }
          setShowLogin={ setShowLogin }
        />
        { !noData && <div className="container">
          <div className="continue-button">
            <Link to={ `/photos/all/page/${ +params.pageNum + 1 }`  }>
              <div style={ { textAlign: 'center' } }>
                <FormattedMessage id='showMore' />
              </div>
              <span className="join-helper">
                <FormattedMessage id='showMore' />
              </span>
            </Link>
          </div>
        </div> }
      </div>
    )
  else if (loading)
    return (
      <>
        <p className='search-result'>
          <FormattedMessage id='loading' />
        </p>
      </>
    )
  else
    return (
      <>
        <p className='search-result'>
          <FormattedMessage id='noResults' />
        </p>
      </>
    )
}
