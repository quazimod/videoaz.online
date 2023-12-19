const express = require('express');
const router = express.Router();
const auth = require('../rest/auth.js')
const cors = require('cors')
const corsOptions = { 
  origin: [/video[a-z]{2}.online/, /new24video.com/, /localhost:[0-9]+/],
  credentials: true
}
router.use(cors(corsOptions))

/* GET check subscription status. */
router.get('/subscription/status', auth.checkSubscription);
/* GET subsription link. */
router.get('/subscription/link', auth.getSubsribeLink);
/* GET check auth status */
router.get('/check', auth.checkAuth);
/* POST login */
router.post('/login', auth.doLogin);
/* POST logout */
router.post('/logout', auth.doLogout);

module.exports = router;