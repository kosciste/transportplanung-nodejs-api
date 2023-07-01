const mysql = require('mysql2')
require('dotenv').config()

/**
 * Create a connection pool for the specified database and wraps it
 * into a promise as described in the mysql2 docs.
 * @type {Pool}
 */
const pool = mysql.createPool({
    host: process.env.DB_HOST,
    database: process.env.DB,
    port: process.env.DB_PORT,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    connectionLimit: 15,
}).promise()

/**
 * This method gets a free connection out of the connection pool
 * and runs the query on the database with an array of parameters.
 * @param sql
 * @return {Promise<*>}
 */
const querySQLWithParams = async (sql,params)=>{
    let [rows, fields] = await pool.query(sql,params)
    return rows
}

/**
 * This method gets a free connection out of the connection pool
 * and runs the query on the database without parameters.
 * @param sql
 * @return {Promise<*>}
 */
const querySQL = async (sql)=>{
    let [rows, fields] = await pool.query(sql)
    return rows
}

module.exports = {
    querySQL: querySQL,
    querySQLWithParams: querySQLWithParams
};