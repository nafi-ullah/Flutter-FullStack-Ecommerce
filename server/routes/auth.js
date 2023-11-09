const express = require("express"); // import from package



const authRouter = express.Router();

authRouter.get('/user', (req,res)=>{
    res.json({msg: "nafo "});

});

module.exports = authRouter;//to export this files variables