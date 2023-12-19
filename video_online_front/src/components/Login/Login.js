/* eslint-disable react/prop-types */
import axios from 'axios'
import React, { useState } from 'react'
import InputMask from 'react-input-mask'
import { NotificationManager } from 'react-notifications'
import 'react-notifications/lib/notifications.css'
import Auth from '../../services/auth'
import { DOMAIN, API_URL } from '../../config/config'
import { getCleanPhone, getDefaultPhoneVal, getPhoneMask, getPhoneValidator } from '../../utils/phone'
import { FormattedMessage, useIntl } from 'react-intl'

export default function Login ({ show, setShowLogin }) {
  const [phone, setPhone] = useState('')
  //const [wrongPhone, setWrongPhone] = useState(false)
  const style = { display: show ? 'block' : 'none' }
  const intl = useIntl()

  const authorize = () => {
    if (!getPhoneValidator().test(phone)) {
      NotificationManager.error(intl.formatMessage('invalidPhone'))
      return
    }

    Auth.checkSubscription(getCleanPhone(phone))
  }

  const register = () => {
    axios.get(`${ API_URL }/auth/subscription/link?domain=${ DOMAIN }`)
      .then(res => {
        window.location.replace(res.data.subscribeLink)
      })
      .catch(err => {
        console.error(err)
        NotificationManager.error(intl.formatMessage('serverError'))
      })
  }

  return (
    <div id="loginModal" className="modal" style={ style }>
      <div className="modal-content">
        <span className="close" onClick={ () => setShowLogin(false) } />
        <form id="telephone-form" className="telephone-form"
          onSubmit={ e => {
            e.preventDefault()
            authorize()
          } }>
          <h2>
            <strong><FormattedMessage id="login" /></strong>
          </h2>
          <span><FormattedMessage id="enterPhoneNumber" /></span>
          <div className="tel-mask">
            <InputMask
              type="tel"
              className="tel-input"
              placeholder={ getDefaultPhoneVal() }
              name="phone"
              id="phone-subscribe"
              defaultValue=""
              mask={ getPhoneMask() }
              pattern={  (() => {
                let pattern = getPhoneValidator().toString()
                return pattern.slice(1, pattern.length - 1)
              })() }
              onChange={ e => setPhone(e.target.value) }
              required
              autoFocus
            />
          </div>
          {/*			<span class="desc-inpt">Проверочный код будет выслан на указанный номер телефона</span>*/}
          <button type="submit" id="continue-subscribe" className="continue-button">
            <span style={ { color: '#fff' } } id="continue-button-text">
              <FormattedMessage id="login" />
            </span>
            <span className="spin-loader" style={ { display: 'none' } }>
              <div className="bounce1" />
              <div className="bounce2" />
              <div className="bounce3" />
            </span>
          </button>
          <a
            href="#"
            onClick={ register }
            className="imusertxt"
            style={ { cursor: 'pointer', textDecoration: 'underline' } }
          >
            <FormattedMessage id="register" />
          </a>
        </form>
      </div>
    </div>

  )
}
