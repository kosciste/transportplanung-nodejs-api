const jwt = require("jsonwebtoken");
require('dotenv').config()

const getTokenPayload = (user, type) => {
    let date = new Date();
    let expDate = new Date(date.getTime()+(1000*30))
    return {
        "iss": process.env.APP_NAME,
        "typ": type,
        "iat": date.toString(),
        "exp": expDate.toString(),
        "sub": user,
    }
}

const generateAccessToken = (user) => {
    return jwt.sign(getTokenPayload(user, "access"), process.env.ACCESS_TOKEN_SECRET,
        {expiresIn: process.env.ACCESS_TOKEN_EXPIRES_IN})
}

const generateRefreshToken = (user) =>{
    return jwt.sign(getTokenPayload(user, "refresh"), process.env.REFRESH_TOKEN_SECRET,
        {expiresIn: process.env.REFRESH_TOKEN_EXPIRES_IN})
}

