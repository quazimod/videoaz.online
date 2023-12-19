var express = require('express');
var router = express.Router();
const videos = require('../rest/videos.js')
const cors = require('cors')
const corsOptions = { 
  origin: [/video[a-z]{2}.online/, /new24video.com/, /localhost:[0-9]+/],
  credentials: true
}
router.use(cors(corsOptions))

/* GET recent videos. */
router.get('/recent', videos.getRecent);

/* GET popular videos. */
router.get('/popular', videos.getPopular);

/* GET all videos. */
router.get('/all/:pageNum', videos.getAll);

/* GET single video. */
router.get('/:id', videos.getSingle);

// /* GET video. */
// router.get('/:id/load/:resolution', videos.load);

// /* GET video poster. */
// router.get('/:id/poster', videos.getPoster);

/* POST generate video album. */
//router.post('/:id/album/generate', videos.generateAlbum);

/* GET video album image. */
// router.get('/:video_id/album/:image_id', videos.getAlbumImage);

// /* GET download video. */
// router.get('/:id/download/:resolution', videos.download);

/* GET search videos by tag. */
router.get('/search/tags/:tag/:pageNum', videos.searchByTag);

module.exports = router;
