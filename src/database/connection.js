var knex = require('knex')({
    client: 'mysql',
    connection: {
        host : '127.0.0.1',     
        user : 'root',       
        database : 'db_estoque'       
    }
});
module.exports = knex