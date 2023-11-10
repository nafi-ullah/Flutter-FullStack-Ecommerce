const mongoose = require('mongoose');

//schema hocche structure of application for database

const userSchema = mongoose.Schema({
    name: {
        required: true, // always can enter
        type: String,
        trim: true // extra space trim kore dibe
    },
    email: {
        required: true,
        type: String,
        trim: true,
        validate: {
            validator: (value) => {
                const re= /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
                return value.match(re);
            },
            message: 'Please enter a valid email address',
        }
    },
    password: {
        required: true,
        type: String,
        validator: (value) => {
            
            return value.lenght < 5;
        },
        message: 'Please enter a more than 5 letter',
    },
    address:{
        type: String,
        default: '',
    },
    type: { // seller or admin
        type: String,
        default: 'user',
    }

});

//for create model
const User = mongoose.model("User", userSchema);

module.exports = User;