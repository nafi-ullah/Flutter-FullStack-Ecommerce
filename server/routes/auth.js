const express = require("express");
const User= require("../models/user");
const bcryptjs = require('bcryptjs');

const authRouter = express.Router();


//to get data from database
// authRouter.get("/user",(req,res)=>{  // creating api link and activity
//     res.json({msg: "nafii"});
// });
//sign up
authRouter.post("/api/signup",async (req,res)=>{
    try{
        //get the data from client
    const {name,email,password} = req.body;
    //authentication email for duplicate and other things.
     const existingUser= await  User.findOne({email}); // is there any same imail exist in database
                                                       // findone function ta promise, tai await dite hobe wait korar somoy cheye newar jnno
                                                       
     if(existingUser){
         return res.status(400).json({ msg: "User with same email already exist"});
     } // jehetu email already ase, sehetu customize status code diye alert kore dewa jabe..
     
        //password hide process
        const hashedPassword= await bcryptjs.hash(password,8);  


 
 // create and save user whaterver get from client,
         let user = new User ({
             email,
             password: hashedPassword,
             name
         }
         );
         user = await user.save();
 
 
         res.json(user);
    }catch(e){
            res.status(500).json({error: e.message}); // server error response
    }

    
    //post that data in database

    //return that data to the user
});

module.exports = authRouter;