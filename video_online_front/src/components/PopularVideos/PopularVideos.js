/* eslint-disable react/prop-types */
import axios from 'axios'
import React, { useEffect, useState } from 'react'
import { NotificationManager } from 'react-notifications'
import { Link } from 'react-router-dom'
import { API_URL, DOMAIN } from '../../config/config'
import VideoGallery from '../VideoGallery'
import { useIntl, FormattedMessage } from 'react-intl'

export default function PopularVideos ({ isAuthed, setShowLogin }) {
  const [popularVideos, setPopularVideos] = useState([])

  const intl = useIntl()

  useEffect(() => {
    axios.get(`${ API_URL }/videos/popular?domain=${ DOMAIN }`)
      .then(res => {
        if (res.data) {
          setPopularVideos(res.data)
        }
      })
      .catch(err => {
        console.error(err)
        NotificationManager.error('Произошла ошибка при обращении к серверу. Повторите попытку позднее')
      })
  }, [])

  return (
    <>
      <VideoGallery
        videos={ popularVideos }
        title={ intl.formatMessage({ id: 'popularVideos' }) }
        isAuthed={ isAuthed }
        setShowLogin={ setShowLogin }
      />
      <div className="container">
        <div className="continue-button">
          <Link to="/videos/all">
            <div style={ { textAlign: 'center' } }>
              <FormattedMessage id="allVideos" />
            </div>
            <span className="join-helper">
              <FormattedMessage id="allVideos" />
            </span>
          </Link>
        </div>
      </div>
    </>
  )
}
