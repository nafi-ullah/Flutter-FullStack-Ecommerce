
const express = require("express"); // similar to import 'package:express/express.dart';
const authRouter = require("./routes/auth"); // import from other file

const PORT = 3000;
const app= express();

//middleware // additionally it connect
app.use(authRouter);
//client ->middle-wire -> server -> client


app.listen(PORT, ()=> {   //for connection of local host.
    console.log(`connected at port ${PORT} ` );
});


