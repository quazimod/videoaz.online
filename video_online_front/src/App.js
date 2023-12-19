/* eslint-disable react/prop-types */
import { BrowserRouter as Router, createSearchParams, Link, Navigate, Route, Routes } from 'react-router-dom'
import React, { useEffect, useState } from 'react'
import Main from './components/Main'
import Home from './pages/Home'
import Single from './pages/Single'
import Agreement from './pages/Agreement'
import Policy from './pages/Policy'
import Search from './pages/Search'
import Videos from './pages/Videos'
import Photos from './pages/Photos'
import { API_URL } from './config/config'
import axios from 'axios'
import { NotificationContainer, NotificationManager } from 'react-notifications'
import './App.css'
import Auth from './services/auth'
import { useIntl, FormattedMessage } from 'react-intl'
import LoginAdmin from './pages/admin/Login'
import HomeAdmin from './pages/admin/Home'

function App ({ setLocale }) {
  const [isAuthed, setAuthed] = useState(false)
  const [adminAuthed, setAdminAuthed] = useState(false)
  const [showLogin, setShowLogin] = useState(false)

  const intl = useIntl()

  useEffect(() => {
    const params = createSearchParams(window.location.search)
    const msisdn = params.get('MSISDN'),
      afterSubscribe = Boolean(params.get('after_subscribe')),
      subscribeResult = Boolean(params.get('SubscribeResult')),
      extId = params.get('extId')
    const isActive = (msisdn && !isNaN(msisdn) && (msisdn.length === 11 || msisdn.length === 12)) && afterSubscribe && subscribeResult

    axios.get(`${ API_URL }/auth/check`, { withCredentials: true })
      .then(res => {
        if (res.data.admin)
          setAdminAuthed(true)

        if (!res.data.active) {
          isActive
            && axios.post(`${ API_URL }/auth/login`, {}, { withCredentials: true })
              .then(() =>  window.location.replace('/'))
              .catch(err => {
                console.error(err)
                NotificationManager.error(intl.formatMessage({ id: 'serverError'}))
              })
          extId && !isNaN(extId) && extId.length === 12
            && Auth.checkSubscription(extId, '/')
        } else
          setAuthed(true)
      })
      .catch(err => {
        console.error(err)
        NotificationManager.error(intl.formatMessage({ id: 'serverError'}))
      })
  }, [])

  return (
    <>
      <Router>
        <Routes>
          <Route path="/" element={ <Main isAuthed={ isAuthed } adminAuthed={ adminAuthed } showLogin={ showLogin } setShowLogin={ setShowLogin } setLocale={ setLocale }/> }>
            <Route index element={ <Home isAuthed={ isAuthed } setShowLogin={ setShowLogin } /> } />
            <Route path="video/:id" element={ <Single isAuthed={ isAuthed } setShowLogin={ setShowLogin } /> } />
            <Route path="videos/all" element={ <Navigate to="page/1" replace={ true } /> } />
            <Route path="videos/all/page/:pageNum" element={ <Videos isAuthed={ isAuthed } setShowLogin={ setShowLogin } /> } />
            <Route path="videos/tags/:tag" element={ <Navigate to="page/1" replace={ true } /> } />
            <Route path="videos/tags/:tag/page/:pageNum" element={ <Search isAuthed={ isAuthed } setShowLogin={ setShowLogin } /> } />
            <Route path="photos/all" element={ <Navigate to="page/1" replace={ true } /> } />
            <Route path="photos/all/page/:pageNum" element={ <Photos isAuthed={ isAuthed } setShowLogin={ setShowLogin } /> } />
            <Route path="agreement" element={ <Agreement/> } />
            <Route path="policy" element={ <Policy/> } />
            <Route path="admin" element={ <Navigate to="login" replace={ true } /> } />
            <Route path="admin/login" element={ <LoginAdmin setAuthed={ setAuthed } setAdminAuthed={ setAdminAuthed } adminAuthed={ adminAuthed } /> } />
            <Route path="admin/home" element={ <HomeAdmin setAdminAuthed={ setAdminAuthed } adminAuthed={ adminAuthed } /> } />
            <Route
              path="*"
              element={
                <div className='page-not-found'>
                  <h2><FormattedMessage id="pageNotFound" /></h2>
                  <Link to="/">
                    <FormattedMessage id="goBackToHome" />
                  </Link>
                </div>
              }
            />
          </Route>
        </Routes>
      </Router>
      <NotificationContainer/>
    </>
  )
}

export default App
