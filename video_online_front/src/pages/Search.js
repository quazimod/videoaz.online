/* eslint-disable react/prop-types */
import React, { useEffect, useState } from 'react'
import axios from 'axios'
import { API_URL, DOMAIN } from '../config/config'
import { Link, useParams } from 'react-router-dom'
import VideoGallery from '../components/VideoGallery'
import { NotificationManager } from 'react-notifications'
import { FormattedMessage, useIntl } from 'react-intl'

export default function Search ({ isAuthed, setShowLogin }) {
  const [searchResult, setSearchResult] = useState([])
  const [loading, setLoading] = useState(true)
  const [noData, setNoData] = useState(false)

  const params = useParams()
  const { tag, pageNum } = params
  const intl = useIntl()

  useEffect(() => {
    axios.get(`${ API_URL }/videos/search/tags/${ tag }/${ pageNum }?domain=${ DOMAIN }`)
      .then(res => {
        if (res.data) {
          setSearchResult(searchResult.concat(res.data.videos))
          setLoading(false)
          setNoData(res.data.noMoreData)
        }
      })
      .catch(err => {
        console.error(err)
        NotificationManager.error(intl.formatMessage({ id: 'serverError' }))
      })
  }, [tag, pageNum])

  if (searchResult.length)
    return (
      <>
        <VideoGallery
          videos={ searchResult }
          title={ `${intl.formatMessage({ id: 'searchBytag' })} "${ tag }":` }
          isAuthed={ isAuthed }
          setShowLogin={ setShowLogin }
        />
        { !noData && <div className="container">
          <div className="continue-button">
            <Link to={ `/videos/tags/${ tag }/page/${ +pageNum + 1 }`  }>
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
