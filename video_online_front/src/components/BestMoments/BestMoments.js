/* eslint-disable react/prop-types */
import axios from 'axios'
import React, { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { API_URL, AWS_BUCKET_URL, DOMAIN } from '../../config/config'
import PhotoGallery from '../PhotoGallery'
import { useIntl, FormattedMessage } from 'react-intl'

export default function BestMoments ({ isAuthed, setShowLogin }) {
  const [bestMoments, setBestMoments] = useState([])

  const intl = useIntl()

  useEffect(() => {
    axios.get(`${ API_URL }/videos/popular?domain=${ DOMAIN }`)
      .then(res => {
        if (res.data) {
          let photos = []
          res.data.forEach((video, n) => {
            for (let i = 1; i <= 2; i++) {
              const imgPath = `${ AWS_BUCKET_URL }/videos/main/${ video.id }/images/${ i }.webp`,
                className = n > 1 ? 'desktop-only' : ''
              photos.push({ imgPath, className })
            }
          })

          setBestMoments(photos)
        }
      })
      .catch(err => console.error(err))
  }, [])

  if (bestMoments)
    return (
      <>
        <PhotoGallery
          photos={ bestMoments }
          title={ intl.formatMessage({ id: 'bestMoments' }) }
          isAuthed={ isAuthed }
          setShowLogin={ setShowLogin }
        />
        <div className="container">
          <div className="continue-button">
            <Link to="/photos/all">
              <div style={ { textAlign: 'center' } }>
                <FormattedMessage id="allPhotos" />
              </div>
              <span className="join-helper">
                <FormattedMessage id="allPhotos" />
              </span>
            </Link>
          </div>
        </div>
      </>
    )
}
