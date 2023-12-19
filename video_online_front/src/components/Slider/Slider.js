/* eslint-disable react/prop-types */
import React, { useEffect } from 'react'
import { Link } from 'react-router-dom'
import Slick from 'react-slick'
import {AWS_BUCKET_URL} from '../../config/config'
import './Slider.styl'
import { FormattedMessage } from 'react-intl'

export default function Slider({ videos, isAuthed, setShowLogin }) {
  const settings = {
    autoplay: true,
    adaptiveHeight: true
  }

  useEffect(() => {
    var hellopreloader = document.getElementById('hellopreloader_preload')
    function fadeOut(el) {
      if (el != null) {
        el.style.opacity = 1
        var interhellopreloader = setInterval(function () {
          el.style.opacity = el.style.opacity - 0.05
          if (el.style.opacity <= 0.05) {
            clearInterval(interhellopreloader)
            hellopreloader.style.display = 'none'
          }
        }, 16)
      }
    }
    setTimeout(function () {
      fadeOut(hellopreloader)
    }, 1000)
  }, [])

  return (
    <div className="main-carousel">
      <div className="container container-carousel">
        <input id="device" type="hidden" value="desktop" />
        <div className="row">
          <div className="carousel slide poster-slider"
            data-interval="false" style={ { maxWidth: '100%', flex: 'auto' } } data-ride="carousel"
            id="carouselIndicators">
            <div id="hellopreloader">
              <div id="hellopreloader_preload">
                <div className="spinner">
                  <div className="bounce1" />
                  <div className="bounce2" />
                  <div className="bounce3" style={ { marginRight: 0 } } />
                </div>
              </div>
            </div>
            <Slick className="carousel-inner" { ...settings }>
              {
                videos.map((v, i) =>
                  <Link
                    key={ i }
                    to={ isAuthed ? `/video/${ v.id }/` : '#' }
                    onClick={ () => !isAuthed && setShowLogin(true) }
                    className="guest"
                  >
                    <div className="single-item">

                      <div className="video-info-btn">
                        <FormattedMessage id="watch" />
                      </div>

                      <img className="poster-img" src={ `${ AWS_BUCKET_URL }/videos/main/${ v.id }/images/poster.webp` } alt="" />
                      <div className="quality-icons block-video-play-none">
                        {/* <a href="/categories/space/" className="button-carousel block-video-play-none">Космос</a> */}
                        <h2 className="name-video">{ v.title }</h2>
                      </div>
                    </div>
                  </Link>
                )
              }
            </Slick>
          </div>
        </div>
      </div>
    </div>
  )
}
