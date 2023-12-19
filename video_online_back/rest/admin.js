const config = require("../config/config")
const { db } = require("../config/db")
const s3 = require("../libs/s3Client")
const conv = require('promised-webp-converter');
const fs = require('fs')

const admin = {
  /* checkAuth: (req, resp) => {
    const active = req.cookies.adm_is_active === 'true'
    resp.send({ active })
  }, */
  doLogout: (req, resp) => {
    resp.clearCookie('adm_is_active').send({ ok: true })
  },
  login: (req, resp) => {
    const { username, password } = req.body
    const { siteLogin } = req.query

    if (username === 'admin' && password === 'Klovka56') {
      resp.cookie('adm_is_active', true, { maxAge: 60 * 1000 * 60 })
      if (siteLogin)
        resp.cookie('is_active', true, { maxAge: 60 * 1000 * 60 })

      resp.send({ ok: true })
    }
    else
      resp.send({ ok: false, error: "Неверный логин или пароль" })
  },
  manager: {
    updateVideos: (req, resp) => {
      const { videos, domain } = req.body

      let resultUpdQuery = ''
      videos.forEach(video => {
        const { id, title, likes_count, tags, show } = video

        resultUpdQuery +=
          `UPDATE video_online.t_videos SET (title, likes_count) = ('${ title }', ${ likes_count })
            WHERE id = ${ id };
          UPDATE video_online.t_videos_tags_assoc SET tags = '${ tags }'
            WHERE video_id = ${ id };
          UPDATE video_online.t_domains_videos_assoc_settings SET show = ${ show }
            WHERE video_id = ${ id }
            AND domain_id = (SELECT id FROM video_online.t_domains WHERE name = '${ domain }');\r\n`
      });

      db.query(resultUpdQuery)
        .then(() => resp.send({ ok: true }))
        .catch(err => resp.send({ ok: false, error: err.message }))
    },
    updateVideoPreview: async (req, resp) => {
      try {
        const { preview } = req.files,
          { data, name } = preview,
          fileExt = name.split('.')[1],
          { videoId } = req.body,
          previewObjPath = `videos/main/${ videoId }/images/poster.webp`,
          convTempPath = './node_modules/promised-webp-converter/temp'

        if (!['png', 'jpg', 'jpeg'].includes(fileExt)) {
          return resp.send({ error: "Invalid image format. Must be png or jpeg." })
        }

        try {
          await fs.accessSync(convTempPath)
        } catch (err) {
          fs.mkdirSync(convTempPath)
        }

        conv.grant_permission()
        const convPreviewBuffer = await conv.buffer2webpbuffer(data, fileExt, "-q 80 -resize 1280 0");

        s3.putObject({
          Bucket: config.AWS.BUCKET,
          Key: previewObjPath,
          Body: convPreviewBuffer,
          ContentType: "image/webp", 
          ContentLength: convPreviewBuffer.length
        }, (err, _) => {
          if (err) {
            resp.send({ ok: false, error: err.message })
            return
          }
          
          resp.send({ ok: true })
        })
      } catch (err) {
        console.log(err)
        resp.send({ ok: false, error: err.message })
      }
    }
  }
}

module.exports = admin