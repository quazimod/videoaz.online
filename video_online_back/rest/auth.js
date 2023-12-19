const axios = require("axios")

const auth = {
  _getSubsribeLink: (domain) => {
    switch (domain) {
      case 'videoaz.online':
        return 'http://larambra.com/click/mGFZup'
      case 'videouz.online':
        return 'http://larambra.com/click/yNhXTB'
      case 'new24video.com':
        return 'http://mobaff.ru/ref-v2/b77403f0f6f6?landing_page=532&op_name=tele2'
          
      default:
        break;
    }
  },
  checkSubscription: (req, resp, next) => {
    const { msisdn, token, domain } = req.query
    
    if (typeof msisdn !== 'number' || typeof token !== 'string') {
      resp.status(500).send({ error : "Number or token format is invalid" })
      return
    }
    
    axios.get(`https://larambra.com/subsInfo?token=${ token }&msisdn=${ msisdn }&service=${ domain }`)
      .then((res) => {
        if (res.data.status === 'active') {
          resp.cookie('is_active', true, { maxAge: 60 * 1000 * 60 })
            .send({ active : true })
        } else {
          const redirectLink = auth._getSubsribeLink(domain)
          resp.send({ redirectLink })
        }
      })
      .catch(err => {
        console.error(err)
        resp.status(500).send(err)
      })
  },
  getSubsribeLink: (req, resp) => {
    const subscribeLink = auth._getSubsribeLink(req.query.domain)
    resp.send({ subscribeLink })
  },
  checkAuth: (req, resp) => {
    const is_active  = req.cookies.is_active === 'true',
      adm_is_active  = req.cookies.adm_is_active === 'true'

    resp.send({ active: is_active, admin: adm_is_active })
  },
  doLogout: (_, resp) => {
    resp.clearCookie('is_active').sendStatus(200)
  },
  doLogin: (_, resp) => {
    resp.cookie('is_active', true, { maxAge: 60 * 1000 * 60 }).sendStatus(200)
  },
}

module.exports = auth