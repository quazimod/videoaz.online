import axios from 'axios'
import { NotificationManager } from 'react-notifications'
import { DOMAIN, API_URL, SUBSCRIPTION_TOKEN } from '../config/config'

const Auth = {
  checkSubscription: (msisdn, redirect) => {
    axios.get(`${ API_URL }/auth/subscription/status?msisdn=${ msisdn }&token=${ SUBSCRIPTION_TOKEN }&domain=${ DOMAIN }`,
      { withCredentials: true }
    )
      .then(res => {
        if (res.data.active)
          redirect
            ? window.location.replace(redirect)
            : window.location.reload()
        else
          window.location.replace(res.data.redirectLink)
      })
      .catch(err => {
        console.error(err)
        NotificationManager.error('Произошла ошибка при обращении к серверу. Повторите попытку позднее')
      })
  }
}

export default Auth