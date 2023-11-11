const express = require("express");
const User= require("../models/user");
const bcryptjs = require('bcryptjs');
const jwt = require('jsonwebtoken');

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
 
 
        //return that data to the user
         res.json(user);
    }catch(e){
            res.status(500).json({error: e.message}); // server error response
    }

    
    //post that data in database
    
});


//Sign in Route
authRouter.post("/api/signin", async(req,res)=>{
    try{
        const { email, password } = req.body;

        const user = await User.findOne({ email });
        if (!user) {
          return res
            .status(400)
            .json({ msg: "User with this email does not exist!" });
        }
    
        const isMatch = await bcryptjs.compare(password, user.password);
        if (!isMatch) {
          return res.status(400).json({ msg: "Incorrect password." });
        }
    

       const token =  jwt.sign({id: user._id}, "passwordKey");
          res.json({token, ...user._doc});  
        /**
         * 'token': token blah blah
         * 'name': 'Nafi',
         * 'email': 'nafi@gmail.com',
         * 
         *  */  
        
    }catch(e){
        res.status(500).json({error: e.message}); 
    }
})


module.exports = authRouter;