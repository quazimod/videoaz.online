/* eslint-disable no-undef */

const { protocol, host } = window.location
const { language } = navigator
const locale = language === 'ru-RU' ? 'ru' : language
const isDebug = process.env.NODE_ENV === 'development'

const config = {
  API_URL: isDebug
    ? process.env.REACT_APP_API_URL
    : `${ protocol }//api.${ host }`,
  AWS_BUCKET_URL: 'https://video-online.s3.eu-central-1.amazonaws.com',
  IS_DEBUG: isDebug,
  DOMAIN: isDebug ? 'videoaz.online' : host,
  LOCALE: isDebug ? 'ru' : locale,
  IS_DESKTOP: window.matchMedia('(min-width: 769px)').matches,
  LANGUAGES: ['ru', 'az', 'uz'],
  SUBSCRIPTION_TOKEN: 'fydewyr23684etgdy3e'
}

const { API_URL, AWS_BUCKET_URL, IS_DEBUG, DOMAIN, LOCALE, IS_DESKTOP, LANGUAGES, SUBSCRIPTION_TOKEN } = config

export { config, API_URL, AWS_BUCKET_URL, IS_DEBUG, DOMAIN, LOCALE, IS_DESKTOP, LANGUAGES, SUBSCRIPTION_TOKEN }