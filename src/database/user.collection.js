const {querySQL, querySQLWithParams} = require('./database');

/*
async function getByName(name){
    let sql = "SELECT * FROM transportplanung.users WHERE name = ?;"
    return querySQLWithParams(sql, name).then((res)=>{
        return res
    }).catch((e)=>{
        console.log("error:" + e)
    })
}*/

async function getByName(name){
    let sql = "SELECT * FROM transportplanung.users WHERE name = ?;"
    try{
        return await querySQLWithParams(sql, name)
    } catch (e) {
        console.log("error:" + e)
    }
}


async function getAllUsers(){
    let sql = "SELECT * FROM transportplanung.users;"
    try{
        let users = await querySQL(sql)
        return {"users": users}
    } catch (e) {
        console.log("error" + e)
        return {"error": e}
    }
}

async function addUser(user){
    let sql = "INSERT INTO transportplanung.users;"
    try{
        let user = await querySQLWithParams(sql, user)
        return {"user": user}
    } catch (e) {
        console.log("error" + e)
        return {"error": e}
    }
}

async function deleteUser(user_id){
    let sql = "INSERT INTO transportplanung.users;"
    try{
        let users = await querySQLWithParams(sql, user)
        return {"user": user}
    } catch (e) {
        console.log("error" + e)
        return {"error": e}
    }
}

module.exports = {
    getByName: getByName,
    addUser: addUser
}