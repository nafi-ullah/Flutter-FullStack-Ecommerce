const jwt = require('jsonwebtoken');

const auth = async (req, res, next) => {
    try {
        const token = req.header('x-auth-token');
       console.log("Token:", token);

        if (!token)
            return res.status(401).json({ msg: "No auth token, access denied" });
        else{
            console.log('Why man why');
        }

        const verified = jwt.verify(token, 'passwordKey');
        console.log("Verified:", verified);

        if (!verified)
            return res.status(401).json({ msg: "Token verification failed, authorization denied" });
        else{
            console.log("yes verified");
        }

        req.user = verified.id;
        req.token = token;
        console.log("id:", req.user);
        console.log("tokss:", req.token);

        next();

    }catch(err){
        res.status(500).json({error: err.message});
    }

}

module.exports = auth;