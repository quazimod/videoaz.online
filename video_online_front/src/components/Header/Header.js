/* eslint-disable react/prop-types */
import axios from 'axios'
import React, { useState } from 'react'
import { NotificationManager } from 'react-notifications'
import { Link } from 'react-router-dom'
import { API_URL, IS_DESKTOP, LANGUAGES } from '../../config/config'
import Login from '../Login'
import { getBigLogoText, getSmallLogoText } from '../../utils/logo'
import { FormattedMessage, useIntl } from 'react-intl'
import { Collapse } from 'react-collapse'
import './Header.css'


export default function Header ({ isAuthed, adminAuthed, showLogin, setShowLogin, setLocale }) {
  const [showMenu, setShowMenu] = useState(false)

  const intl = useIntl()
  const language = localStorage.getItem('lang')

  const doLogout = () => {
    axios.post(`${ API_URL }/auth/logout`, {},  { withCredentials: true })
      .then(() => {
        window.location.reload()
      })
      .catch(err => {
        console.error(err)
        NotificationManager.error(intl.formatMessage({ id: 'serverError'}))
      })
  }

  return (
    <>
      <Collapse isOpened={ IS_DESKTOP ? true : showMenu } >
        <nav className={ `navbar-collapse ${ showMenu ? 'nav-opened' : ''}` } role="navigation" id="headbar">
          <div className="navbar-box">
            <ul>
              {/* <li>
              <Link to="/categories/">Категории</Link>
            </li> */}
              {/* <li><Link to="/actors/" class="menus">Модели</Link></li> */}
              <li>
                <Link to="/videos/all" className="menus" onClick={ () => setShowMenu(false) }>
                  <FormattedMessage id="videos" />
                </Link>
              </li>
              {/* <li>
              <Link to="/albums/" className="menus">Альбомы</Link>
            </li> */}
              <li>
                <Link to="/photos/all" className="menus"  onClick={ () => setShowMenu(false) }>
                  <FormattedMessage id="photos" />
                </Link>
              </li>
              <li className="mobile-only">
                <Link to="/agreement" className="menus" onClick={ () => setShowMenu(false) }>
                  <FormattedMessage id="userAgreement" />
                </Link>
              </li>
              <li className="mobile-only">
                <Link to="/policy" className="menus" onClick={ () => setShowMenu(false) }>
                  <FormattedMessage id="policy" />
                </Link>
              </li>
              {/* <li><Link to="/aboutus/" class="menus">О нас</Link></li> */}
            </ul>
            <div className="header_drop_menu">
              <button className="header_white_menu collapse_btn collapsed" data-toggle="collapse" data-target="#header_lang_menu" aria-expanded="false" aria-controls="header_lang_menu">
                <a onClick={ () => setLocale(language) }>
                  <img src={ `/img/${ language }.svg` } alt=""/>
                </a>
                <b className="caret"></b>
              </button>
              <ul className="collapse" id="header_lang_menu" data-parent="#header" aria-expanded="false" style={ { height: '2px' } }>
                {
                  LANGUAGES.filter(lg => lg != language)
                    .map((v, i) =>
                      <li key={ i }>
                        <button onClick={ () => setLocale(v) } >
                          <img src={ `/img/${ v }.svg` } alt=""/>
                        </button>
                      </li>
                    )
                }
              </ul>
            </div>
            { !isAuthed
              ? <a href="#" className="header-btn" onClick={ () => setShowLogin(true) }>
                <FormattedMessage id="login" />
              </a>
              : <a href="#" className="header-btn" onClick={ doLogout }>
                <FormattedMessage id="logout" />
              </a>
            }
            {
              adminAuthed
              &&
              <Link to="/admin/home" className="header-btn">
                Админ
              </Link>
            }
          </div>
        </nav>
      </Collapse>
      <div onClick={ () => setShowMenu(!showMenu) } className={ `hamburger hamburger--slider ${ showMenu ? 'is-active' : '' }` } tabIndex="0" aria-label="Menu" role="button" aria-controls="navigation">
        <div className="hamburger-box">
          <div className="hamburger-inner"></div>
        </div>
      </div>
      <header className="navbar-fixed-top">
        <div className="container">
          <div className="row">
            <Link to="/" className="logo-header">
              <div>
                <h1 className="logobig"> { getBigLogoText() } <span className="logosmall">{ getSmallLogoText() }</span></h1>
              </div>
            </Link>
          </div>
        </div>
        <Login show={ showLogin } setShowLogin={ setShowLogin } />
      </header>
    </>
  )
}
