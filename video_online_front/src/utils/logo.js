import { DOMAIN } from '../config/config'

const logoTextParts = DOMAIN.split('.')

let logoRE = null
switch (DOMAIN) {
case 'videoaz.online':
  logoRE = /(video)(az)/
  break
case 'videouz.online':
  logoRE = /(video)(uz)/
  break
case 'new24video.com':
  logoRE = /(new24)(video)/
  break

default:
  break
}

export const getBigLogoText = () => {
  return logoTextParts[0].replace(logoRE,
    (_, p1, p2) => p1[0].toUpperCase() + p1.slice(1) + p2.toUpperCase() )
}

export const getSmallLogoText = () => {
  return logoTextParts[1]
}