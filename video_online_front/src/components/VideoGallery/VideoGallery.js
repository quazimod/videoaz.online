/* eslint-disable react/prop-types */
import React from 'react'
import { Link } from 'react-router-dom'
import { AWS_BUCKET_URL } from '../../config/config'

export default function VideoGallery ({ videos, title, isAuthed, setShowLogin }) {
  if (videos)
    return (
      <>
        <div className="video-container">
          <div className="container">
            <div className="row">
              <h2>
                <span className="bold">{ title }</span>
              </h2>
              { videos
                ? videos.map(v => (
                  <div key={ v.id } className="col-sm-12 col-md-6 video-item">
                    <a href="#" className="video-title bold">
                      { v.title }
                    </a>
                    <Link
                      to={ isAuthed ? `/video/${ v.id }` : '#' }
                      onClick={ () => !isAuthed && setShowLogin(true) }
                      className="video-view top-video">
                      <div className="img">
                        <img src={ `${ AWS_BUCKET_URL }/videos/main/${ v.id }/images/poster.webp` } alt={ v.title } className="video-bg" />
                        <div className="video-info">
                          <span>
                            <img src="/img/like.svg" alt="Likes" />
                            { v.likes_count }
                          </span>
                          {/* <span>
                          <img src="./img/eye.svg" alt="" />
                          { v.viewsCount }
                        </span>
                        <span>
                          <img src="./img/time.svg" alt="" />
                          {v.duration}
                        </span> */}
                        </div>
                      </div>
                      <div className="video-info-btn">Смотреть</div>
                    </Link>
                    <div className="undervideo">
                      <div className="video-tags">
                        { v.tags.split(', ').map((tag, i) => (
                          <Link
                            key={ i }
                            to={ isAuthed ? `/videos/tags/${ tag }` : '#' }
                            onClick={ () => !isAuthed && setShowLogin(true) }
                            className="light">
                            { tag }
                          </Link>
                        ))
                        }
                      </div>
                    </div>
                  </div>
                ))
                : null }
            </div>
          </div>
        </div>
      </>
    )
}
