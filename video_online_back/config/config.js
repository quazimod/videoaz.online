require('dotenv').config()

module.exports = {
  DB_CONN: process.env.DB_CONNECTION_STRING,
  AWS: {
    BUCKET: 'video-online',
  }
}