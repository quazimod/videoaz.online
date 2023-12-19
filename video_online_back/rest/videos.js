const { db } = require("../config/db")

// var ffmpeg = require('fluent-ffmpeg');
// var fs = require('fs')

const videos = {
  defaults: {
    itemsPerPage: 5
  },
  getRecent: (req, resp) => {
    const { domain } = req.query

    db.many(`SELECT v.*, t.tags FROM video_online.t_videos as v
      JOIN video_online.t_videos_tags_assoc as t ON t.video_id = v.id
      JOIN video_online.t_domains_videos_assoc_settings as t2 ON t2.video_id = v.id
      AND t2.domain_id = (SELECT id FROM video_online.t_domains WHERE name = '${ domain }')
      AND t2.show = true
      ORDER BY id DESC LIMIT 3`)
      .then((res) => {
        return resp.send(res)
      })
      .catch(err => {
        console.error(err)
        resp.status(500).send('Unexpected error on server.')
      })
  },
  getPopular: (req, resp) => {
    const { domain } = req.query

    db.many(`SELECT v.*, t.tags FROM video_online.t_videos as v
      JOIN video_online.t_videos_tags_assoc as t ON t.video_id = v.id
      JOIN video_online.t_domains_videos_assoc_settings as t2 ON t2.video_id = v.id
      AND t2.domain_id = (SELECT id FROM video_online.t_domains WHERE name = '${ domain }')
      AND t2.show = true
      ORDER BY likes_count DESC LIMIT 4`)
      .then((res) => {
        return resp.send(res)
      })
      .catch(err => {
        console.error(err)
        resp.status(500).send('Unexpected error on server.')
      })
  },
  getAll: async (req, resp) => {
    const { itemsPerPage = videos.defaults.itemsPerPage } = req.query,
      pageNum = Number(req.params.pageNum),
      { filter, domain, allResults } = req.query,
      offset = (pageNum - 1) * itemsPerPage,
      cntQuery = `SELECT COUNT(*) FROM video_online.t_videos as v
        ${ !allResults
          ? `JOIN video_online.t_domains_videos_assoc_settings as t2 ON t2.video_id = v.id
            AND t2.domain_id = (SELECT id FROM video_online.t_domains WHERE name = '${ domain }')
            AND t2.show = true`
          : ''
        }
        ${ filter
          ? ` JOIN video_online.t_videos_tags_assoc as t1 ON t1.video_id = v.id
            WHERE CAST(v.id AS TEXT) LIKE '%${ filter }%'
            OR LOWER(v.title) LIKE LOWER('%${ filter }%')
            OR LOWER(t1.tags) LIKE LOWER('%${ filter }%')`
          : '' }`

    let [ { count: countResult } ] = await db.many(cntQuery)
      .catch(err => {
        console.error(err)
        resp.status(500).send('Unexpected error on server.')
      })

    let lastPageIndex = Math.floor(countResult / itemsPerPage) || 1
    const itemsLeft = countResult % itemsPerPage
      lastPageIndex = itemsLeft > 1 && itemsLeft < countResult ? lastPageIndex + 1 : lastPageIndex
      firstItemIndex = ((pageNum - 1) * itemsPerPage) + 1,
      noMoreData = lastPageIndex === pageNum,
      lastItemIndex = firstItemIndex + (itemsPerPage - 1) + (noMoreData ? itemsLeft : 0),
      resultQuery = `SELECT v.*, t1.tags, t2.show
        FROM video_online.t_videos as v 
        JOIN video_online.t_videos_tags_assoc as t1 ON t1.video_id = v.id
        JOIN video_online.t_domains_videos_assoc_settings as t2 ON t2.video_id = v.id
          AND t2.domain_id = (SELECT id FROM video_online.t_domains WHERE name = '${ domain }')
        ${ !allResults ? 'AND t2.show = true' : '' }
        ${ filter
          ? `WHERE CAST(v.id AS TEXT) LIKE '%${ filter }%'
            OR LOWER(v.title) LIKE LOWER('%${ filter }%')
            OR LOWER(t1.tags) LIKE LOWER('%${ filter }%')`
          : '' }
        ORDER BY v.id DESC
        LIMIT ${ noMoreData ? 'ALL' : itemsPerPage } OFFSET ${ offset }`

    db.any(resultQuery)
      .then(videos => {
        return resp.send({ videos, noMoreData, lastPageIndex, firstItemIndex, lastItemIndex, count: Number(countResult)  })
      })
      .catch(err => {
        console.error(err)
        resp.status(500).send('Unexpected error on server.')
      })
  },
  getSingle: (req, resp) => {
    const { id } = req.params
    const { domain } = req.query

    db.one(`SELECT v.*, t1.tags
      FROM video_online.t_videos as v
      JOIN video_online.t_videos_tags_assoc as t1 ON t1.video_id = v.id
      JOIN video_online.t_domains_videos_assoc_settings as t2 ON t2.video_id = v.id
      AND t2.domain_id = (SELECT id FROM video_online.t_domains WHERE name = '${ domain }')
      AND t2.show = true
      WHERE v.id = ${ id }
      ORDER BY id DESC`)
      .then((res) => {
        return resp.send(res)
      })
      .catch(err => {
        console.error(err)
        resp.status(500).send('Unexpected error on server.')
      })
  },
  searchByTag: async (req, resp) => {
    const { tag } = req.params,
      pageNum = Number(req.params.pageNum),
      { domain } = req.query,
      { itemsPerPage } = videos.defaults
      offset = (pageNum - 1) * itemsPerPage

    const [ { count : countResult } ] = await db.many(
      `SELECT COUNT(*) FROM video_online.t_videos as v
      JOIN video_online.t_videos_tags_assoc as t ON t.video_id = v.id
      AND '${ tag }' = ANY (string_to_array(t.tags, ', '))
      JOIN video_online.t_domains_videos_assoc_settings as t2 ON t2.video_id = v.id
      AND t2.domain_id = (SELECT id FROM video_online.t_domains WHERE name = '${ domain }')
      AND t2.show = true`
      ).catch(err => {
        console.error(err)
        resp.status(500).send('Unexpected error on server.')
      })

      const lastPageIndex = Math.floor(countResult / itemsPerPage) || 1,
        noMoreData = lastPageIndex === pageNum
      
    db.any(`SELECT v.*, t.tags FROM video_online.t_videos as v
      JOIN video_online.t_videos_tags_assoc as t ON t.video_id = v.id
      AND $1 = ANY (string_to_array(t.tags, ', '))
      JOIN video_online.t_domains_videos_assoc_settings as t2 ON t2.video_id = v.id
      AND t2.domain_id = (SELECT id FROM video_online.t_domains WHERE name = '${ domain }')
      AND t2.show = true
      ORDER BY id DESC
      LIMIT ${ noMoreData ? 'ALL' : itemsPerPage } OFFSET ${ offset }`, tag
      ).then((videos) => {
        return resp.send({ videos, noMoreData })
      })
      .catch(err => {
        console.error(err)
        resp.status(500).send('Unexpected error on server.')
      })
  }
  /* load: (req, resp) => {
    const videoId = req.params.id
    const rs = req.params.resolution
    const videosDir = req.app.get('videos_folder')
    const pathToVideo = `${ videosDir }/main/${ videoId }/${ videoId }_${ rs }.mp4`
    const stat = fs.statSync(pathToVideo);
    const fileSize = stat.size;
    const range = req.headers.range;
    
    if (range) {
        const parts = range.replace(/bytes=/, "").split("-");
        const start = parseInt(parts[0], 10);
        const end = parts[1]
            ? parseInt(parts[1], 10)
            : fileSize-1;
        const stream = fs.createReadStream(pathToVideo, {start, end});
        const chunksize = (end-start) + 1;
        const head = {
            'Content-Range': `bytes ${start}-${end}/${fileSize}`,
            'Accept-Ranges': 'bytes',
            'Content-Length': chunksize,
            'Content-Type': 'video/mp4',
        };
        
        stream.on('open', () => {
          resp.writeHead(206, head)
          stream.pipe(resp);
        }).on('error', (err) => {
          resp.end(err);
        });
    } else {
        const stream = fs.createReadStream(pathToVideo);
        const head = {
            'Content-Length': fileSize,
            'Content-Type': 'video/mp4',
        };

        stream.on('open', () => {
          resp.writeHead(200, head)
          stream.pipe(resp);
        }).on('error', (err) => {
          resp.end(err);
        });
    }
  },
  getPoster: (req, resp) => {
    const videoId = req.params.id
    const videosDir = req.app.get('videos_folder')
    const imgPath = `${ videosDir }/main/${ videoId }/images/poster.png`
    const stream = fs.createReadStream(imgPath)
    const head = {
      'Content-Length': fs.statSync(imgPath).size,
      'Content-Type': 'image/png',
    };

    stream.on('open', () => {
      resp.writeHead(200, head)
      stream.pipe(resp);
    }).on('error', (err) => {
      resp.end(err);
    });
  },
  getAlbumImage: (req, resp) => {
    const videoId = req.params.video_id
    const imageId = req.params.image_id
    const videosDir = req.app.get('videos_folder')
    const imgPath = `${ videosDir }/main/${ videoId }/images/${ imageId }.png`
    const stream = fs.createReadStream(imgPath)
    const head = {
      'Content-Length': fs.statSync(imgPath).size,
      'Content-Type': 'image/png',
    };

    stream.on('open', () => {
      resp.writeHead(200, head)
      stream.pipe(resp);
    }).on('error', (err) => {
      resp.end(err);
    });
  },
  */
/*   generateAlbum: (req, resp) => {
    const videoId = req.params.id
    const videosDir = req.app.get('videos_folder')

    ffmpeg(`${ videosDir }/main/${ videoId }/${ videoId }_hd.mp4`)
      .on('filenames', (filenames) => {
        console.log(`Will generate ${ filenames.join(', ') } for video: ${ videoId }`)
      })
      .on('error', (err) => {
        console.log('an error happened: ' + err.message);
        resp.send(err.message)
      })
      .on('end', () => {
        console.log('finish');
        resp.send('ok')
      })
      .takeScreenshots({
        count: 1,
        filename: 'poster.png',
        timestamps: ["50%"],
        folder: `${videosDir}/main/${videoId}/images`,
        size: '1280x720'
      })
  }, */
  /*
  download: (req, resp) => {
    const videoId = req.params.id
    const rs = req.params.resolution
    const videosDir = req.app.get('videos_folder')
    const pathToVideo = `${ videosDir }/main/${ videoId }/${ videoId }_${ rs }.mp4`

    resp.download(pathToVideo)
  }, */
}

module.exports = videos;