const express = require("express");

const authRouter = express.Router();


//to get data from database
// authRouter.get("/user",(req,res)=>{  // creating api link and activity
//     res.json({msg: "nafii"});
// });

authRouter.post("/api/signup",(req,res)=>{
    //get the data from client
    const {name,email,password} = req.body;

    //post that data in database

    //return that data to the user
});

module.exports = authRouter;