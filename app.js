const express = require('express')
const app = express()
const port = 4000
const auth = require('./src/routes/auth.router.js')

app.get('/', (req,res)=>{
    res.send("hello mili")
})

app.use('/auth', auth)

app.listen(port, ()=>{
    console.log("app is running on port: " + port)
})