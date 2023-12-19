/* eslint-disable react/prop-types */
import React, { useEffect, useState } from 'react'
import axios from 'axios'
import { API_URL, DOMAIN } from '../config/config'
import VideoGallery from '../components/VideoGallery'
import { Link, useParams } from 'react-router-dom'
import { NotificationManager } from 'react-notifications'
import { FormattedMessage, useIntl } from 'react-intl'

export default function Videos ({ isAuthed, setShowLogin }) {
  const [videos, setVideos] = useState([])
  const [loading, setLoading] = useState(true)
  const [noData, setNoData] = useState(false)

  const params = useParams()
  const intl = useIntl()

  useEffect(() => {
    axios.get(`${ API_URL }/videos/all/${ params.pageNum }?domain=${ DOMAIN }`)
      .then(res => {
        if (res.data) {
          setVideos(videos.concat(res.data.videos))
          setLoading(false)
          setNoData(res.data.noMoreData)
        }
      })
      .catch(err => {
        console.error(err)
        NotificationManager.error(intl.formatMessage({ id: 'serverError' }))
      })
  }, [params.pageNum])

  if (videos.length)
    return (
      <>
        <VideoGallery
          videos={ videos }
          title={ intl.formatMessage({ id: 'allVideos' }) }
          isAuthed={ isAuthed }
          setShowLogin={ setShowLogin }
        />
        { !noData && <div className="container">
          <div className="continue-button">
            <Link to={ `/videos/all/page/${ +params.pageNum + 1 }`  }>
              <div style={ { textAlign: 'center' } }>
                <FormattedMessage id='showMore' />
              </div>
              <span className="join-helper">
                <FormattedMessage id='showMore' />
              </span>
            </Link>
          </div>
        </div> }
      </>
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
