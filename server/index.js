const express = require("express");
const mongoose = require("mongoose"); // just like import 'package:flutter/ packages';
const adminRouter = require("./routes/admin");
const authRouter = require('./routes/auth'); // import other file in main file to run project


const PORT = 3000;
const app = express(); //create express app for creating server
const DB = "mongodb+srv://nafiullah:SWEswe123@cluster0.p1hgigm.mongodb.net/?retryWrites=true&w=majority";



//middleware
app.use(express.json());
app.use(authRouter); // by this as auth.js export the code, here after recieve via authRouter varible, using via app.use
app.use(adminRouter);


//Database connection:

mongoose.connect(DB).then(()=>{
    console.log("Database Connection Successful");
}).catch((e)=>{
    console.log(e);
});

//running in surver
// app.listen(PORT,()=>{
//     console.log(`Connected to my server ${PORT}`);
// });

const server = app.listen(PORT, () => {
    console.log(`Server is running on ${PORT}`);
 });
 

