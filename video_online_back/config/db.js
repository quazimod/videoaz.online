const config = require("./config");
const pgp = require("pg-promise")({});
const db = pgp(config.DB_CONN);

module.exports.db = db