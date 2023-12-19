import React from 'react'
import { getBigLogoText, getSmallLogoText } from '../../utils/logo'
import { Link } from 'react-router-dom'
import { FormattedMessage } from 'react-intl'
import {DOMAIN} from '../../config/config'


export default function Footer () {
  return (
    <footer>
      <div className="container">
        <div className="row">
          <div className="col-lg-12 col-md-12">
            <div className="footer-logo">
              <h1 className="logobig">
                { getBigLogoText() } <span className="logosmall">{ getSmallLogoText() }</span>
              </h1>
              {/* <img src="./img/logograd.svg" alt=""> */}
            </div>
            {/*               <div class="social">
                <span>Мы в соцсетях: </span>

                <span class="social-icons">
                        <a href="#"><img src="/services/videoaz.online/img/vk.svg" alt=""></a>
                        <a href="#"><img src="/services/videoaz.online/img/facebook.svg" alt=""></a>
                        <a href="#"><img src="/services/videoaz.online/img/instagram.svg" alt=""></a>
                        <a href="#"><img src="/services/videoaz.online/img/twitter.svg" alt=""></a>
                    </span>
      */}
          </div>
        </div>
        <div className="col-lg-12 col-md-12 operators"></div>
        {/*
        <div class="col-lg-12 col-md-12 rules">
            <div class="age"><span>18</span></div>
            <span><span class="footer-red">Предупреждение! </span>Этот сайт содержит материала для взрослых с сексуально откровенными сценами, просмотр предназначен только для взрослых! Войдя на этот сайт, вы подтверждаете, что вам исполнилось 18 лет и, если требуется в месте, где вы просматриваете этот сайт, 21 год и старше, что вы добровольно пришли на этот сайт, чтобы просмотреть материалы сексуального характера.</span>
            <div class="checkbox-block">
                <input type="checkbox" id="input-checkbox">
                <label for="input-checkbox">футер для ОСС</label>
            </div>
                    <span class="e-mail">
                        <a href="mailto:support@nightjoy.club"><img src="/services/videoaz.online/img/mail.svg" alt="">
                        abuse@clubjenna.tv</a>
                    </span>
        </div>
      */}
        <div className="col-lg-12 copyright">
          <div className="row">
            <div className="col-lg-12 col-md-12 text-center">
              <span>Copyright (c) { new Date().getFullYear() } { DOMAIN }</span>
            </div>
            <div className="col-lg-12 col-md-12">
              <Link to="/agreement">
                <FormattedMessage id="userAgreement" />
              </Link>
              <Link to="/policy">
                <FormattedMessage id="policy" />
              </Link>
            </div>
          </div>
        </div>
      </div>
    </footer>
  )
}
