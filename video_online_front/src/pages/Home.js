/* eslint-disable react/prop-types */
import React, { useEffect, useState } from 'react'
import Slider from '../components/Slider/Slider'
import axios from 'axios'
import { API_URL, DOMAIN } from '../config/config'
import PopularVideos from '../components/PopularVideos'
import BestMoments from '../components/BestMoments'

export default function Home ({ isAuthed, setShowLogin }) {
  const [recentVideos, setRecentVideos] = useState([])

  useEffect(() => {
    axios.get(`${ API_URL }/videos/recent?domain=${ DOMAIN }`)
      .then(res => {
        if (res.data) {
          setRecentVideos(res.data)
        }
      })
      .catch(err => console.error(err))
  }, [])


  return (
    <>
      <Slider videos={ recentVideos } isAuthed={ isAuthed } setShowLogin={ setShowLogin } />
      <PopularVideos isAuthed={ isAuthed } setShowLogin={ setShowLogin } />
      <BestMoments isAuthed={ isAuthed } setShowLogin={ setShowLogin } />
    </>
  )
}
