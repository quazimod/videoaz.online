import React, { useEffect, useState } from 'react'
import { IntlProvider } from 'react-intl'
import App from '../../App'
import { LOCALE } from '../../config/config'
import { getLocaleMessages } from '../../utils/locale'

function LocalizationWrapper() {
  const [messages, setMessages] = useState(null)
  const [locale, setLocale] = useState('')
  const [loading, setLoading] = useState(true)


  useEffect(() => {
    const params = new URLSearchParams(window.location.search),
      language = params.get('lang')
    const currentLocale = locale || language || LOCALE

    localStorage.setItem('lang', currentLocale)

    const loadMessages = () => getLocaleMessages(currentLocale)
      .then((tr) => {
        setMessages(tr)
        setLoading(false)
      })

    loadMessages()
  }, [locale])

  return (
    !loading
    &&
    <IntlProvider locale={ LOCALE } messages={ messages }>
      <React.StrictMode>
        <App setLocale={ setLocale } />
      </React.StrictMode>
    </IntlProvider>
  )
}
export default LocalizationWrapper