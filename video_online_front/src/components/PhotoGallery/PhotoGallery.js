/* eslint-disable react/prop-types */
import React, { useRef } from 'react'
import Lightbox from '../Lightbox'

export default function PhotoGallery ({ photos, title, isAuthed, setShowLogin }) {
  const photoItems = []
  const lboxRef = useRef()

  if (photos)
    photos.forEach((photo, i) => {
      photoItems.push(
        <div key={ i } className={ `col-md-4 col-sm-6 photo-item ${ photo.className }` }>
          <a
            className="photo-page photo-view"
            onClick={ () => {
              isAuthed ? lboxRef.current.openLightboxOnSlide(i + 1)
                : setShowLogin(true)
            } }
          >
            <div
              className="img"
              style={ { backgroundImage: `url(${ photo.imgPath })` } }
            >
              <img src={ photo.imgPath } alt="" className="photo-bg" />
              {/* <div className="photo-info">
          <span>
            <img
              src="./img/like.svg"
              alt=""
              style={{ marginTop: '-8px' }}
            />
            { photo.likesCount }
          </span>
          <span>
            <img src="./img/eye.svg" alt="" />
            { photo.viewsCount }
          </span>
          <span class="photo-count">
                        <img src="img/camera.png" alt="">
                        35
                    </span>
        </div> */}
            </div>
          </a>
          {/* <div class="underphoto">
                <a href="#">
                    Veronica Clark
                </a>
            </div> */}
        </div>)
    })

  return (
    <div className="photo-container" id="lightgallery">
      <div className="container">
        <h2>
          <span className="bold">{ title ? title.split()[0] : 'Лучшие'} </span>
          <span className="light">{ title ? title.split()[1] : 'моменты'}</span>
        </h2>
        <div className="row">
          <Lightbox items={ photos.map(p => p.imgPath) } ref={ lboxRef } />
          { photoItems }
        </div>
      </div>
    </div>
  )
}
