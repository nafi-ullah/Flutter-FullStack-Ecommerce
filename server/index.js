
const express = require('express');
// similar to import 'package:express/express.dart';

const PORT = 3000;
const app= express();

//create an API
app.listen(PORT, "0.0.0.0", ()=> {
    console.log(`connected at port ${PORT}` );
});


