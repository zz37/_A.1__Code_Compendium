const express = require("express");

const app = express();

// @param: req:request, res:esponse
app.get('/', (req,res) => {
    res.send('ASDFASDFASDFASDFASDFA , jajaj');
});

app.listen(8080, () => {
    console.log('Listening on port 8080');
});