const express = require('express');
const router = express.Router();
const admin = require('../rest/admin.js')
const cors = require('cors')
const corsOptions = { 
  origin: [/video[a-z]{2}.online/, /new24video.com/, /localhost:[0-9]+/],
  credentials: true
}
const fileUpload = require('express-fileupload');

const checkAuth = (req, resp, next) => {
  if (req.cookies.adm_is_active !== 'true') {
    resp.send({ not_authorized: true })
  } else {
    next()
  }
}

router.use(cors(corsOptions))

/* GET check auth status */
//router.get('/checkAuth', admin.checkAuth);
/* POST login */
router.post('/login', admin.login);
/* POST logout */
router.post('/logout', admin.doLogout);
/* POST update videos by manager */
router.post('/manager/updateVideos', checkAuth, admin.manager.updateVideos);
router.post('/manager/updateVideoPreview', checkAuth, fileUpload(), admin.manager.updateVideoPreview);

module.exports = router;