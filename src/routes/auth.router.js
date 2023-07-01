const express = require('express')
const router = express.Router()
const {getByName, addUser} = require("../database/user.collection")

router.get('/register', (req, res)=>{
    getTest(req,res)
})
router.post('/hund', addTest)

async function getTest(req,res){
    let users =  await getByName("test")
    res.json({
        "users": users
    })
}

async function addTest(req,res,next){
    console.log(req.body)
    let user = {
        "name": req.body.name,
        "email": req.body.email,
        "password": req.body.password,
        "role": req.body.role
    }
    let result =  await addUser(user)
    res.json(result)
}

module.exports = router