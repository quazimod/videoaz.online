/* eslint-disable react/no-unknown-property */
/* eslint-disable react/prop-types */
import axios from 'axios'
import React, { useState } from 'react'
import { useIntl } from 'react-intl'
import { NotificationManager } from 'react-notifications'
import { API_URL } from '../../config/config'
import './Login.css'
import { useNavigate } from 'react-router-dom'

export default function Login({ setAuthed, setAdminAuthed, adminAuthed }) {
  const [username, setUsername] = useState('')
  const [password, setPassword] = useState('')
  const [doSiteLogin, setDoSiteLogin] = useState(false)

  const intl = useIntl()
  const navigate = useNavigate()

  if (adminAuthed)
    navigate('/admin/home')

  const authorize = (e) => {
    e.preventDefault()

    axios.post(`${ API_URL }/admin/login?siteLogin=${ doSiteLogin }`,
      { username, password },
      {
        withCredentials: true,
        headers: {
          'Content-Type': 'application/json;charset=UTF-8',
        }
      })
      .then(res => {
        if (res.data.ok) {
          doSiteLogin && setAuthed(true)
          setAdminAuthed(true)
          NotificationManager.success('Успешно авторизован')
          navigate('/admin/home')
        }
        else
          NotificationManager.error(res.data.error)
      })
      .catch(() => NotificationManager.error(intl.formatMessage({ id: 'serverError' })))
  }

  return (
    <div className='admin-login-page'>
      <fieldset>
        <legend>Вход</legend>
        <form>
          <input id="username" placeholder="Пользователь" onChange={ (e) => setUsername(e.target.value) } />
          <input id="password" placeholder="Пароль" type="password" onChange={ (e) => setPassword(e.target.value) } />
          <input id="doSiteLogin" type="checkbox" onChange={ (e) => setDoSiteLogin(e.target.checked) } />
          <label>Залогиниться на портале?</label>
          <button onClick={ authorize }>Войти</button>
        </form>
      </fieldset>
    </div>
  )
}