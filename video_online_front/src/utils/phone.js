import { DOMAIN } from '../config/config'

export const getPhoneMask = () => {
  switch (DOMAIN) {
  case 'videoaz.online':
    return '+\\9\\9\\4-99-999-9999'
  case 'videouz.online':
    return '+\\9\\9\\8-99-999-99-99'
  case 'new24video.com':
    return '+7-999-999-99-99'
  default:
    break
  }
}

export const getDefaultPhoneVal = () => {
  switch (DOMAIN) {
  case 'videoaz.online':
    return '+994-__-___-____'
  case 'videouz.online':
    return '+998-__-___-__-__'
  case 'new24video.com':
    return '+7-___-___-__-__'
  default:
    break
  }
}

export const getPhoneValidator = () => {
  switch (DOMAIN) {
  case 'videoaz.online':
    return /\+(994)-([0-9]{2})-([0-9]{3})-([0-9]{4})/
  case 'videouz.online':
    return /\+(998)-([0-9]{2})-([0-9]{3})-([0-9]{2})-([0-9]{2})/
  case 'new24video.com':
    return /\+(7)-([0-9]{3})-([0-9]{3})-([0-9]{2})-([0-9]{2})/
  default:
    break
  }
}

export const getCleanPhone = (phone) => {
  const parts = ['+', '(', ')', '-', ' ']

  parts.forEach(p => phone = phone.replaceAll(p, ''))

  return phone
}