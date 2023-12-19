/* eslint-disable react/prop-types */
import React from 'react'
import Header from '../Header'
import Footer from '../Footer'
import { Outlet } from 'react-router-dom'

export default function Main ({ isAuthed, adminAuthed, showLogin, setShowLogin, setLocale }) {
  return (
    <>
      <Header isAuthed={ isAuthed } adminAuthed={ adminAuthed } showLogin={ showLogin } setShowLogin={ setShowLogin } setLocale={ setLocale } />
      <Outlet/>
      <Footer/>
    </>
  )
}
