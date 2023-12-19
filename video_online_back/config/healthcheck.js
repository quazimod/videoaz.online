'use strict'

const { db } = require("./db");

function testHealth(callback) {
    db.one('select 1')
        .then(() => callback())
        .catch(() => callback({state: 'unhealthy'}))
}


module.exports = testHealth;