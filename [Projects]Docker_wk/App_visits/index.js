
// require express library and require redis library
const express = require('express');
const redis = require('redis');

// for crashing purposes
const process = require('process');

// make a new instnace of the express app.
const app = express();

// setup a connection to the redis server.
// instead of adding an https page, we can reference the nme of the docker container, --> a the host name.
 // 6379 --> default port number for redis
const client = redis.createClient({
    host: 'redis-server', // connect to the host name of redis-server container, on yml file 
    port: 6379,
});

// initi of visits to 0
client.set('visits', 0);  

/* add row handler for the application
 use the client connection to get the # of times the site is visited. 
 Sendinf the response who ever makes the request.
 Then make sure that it refresh the # of times the site is visited
*/
// exti 0 exited ok, ≠ 0 something is wrong
app.get('/', (req, res) => {
    //process.exit(1); 
    client.get('visits', (err, visits) =>{
        res.send('Numbre of visits ' + visits);
        client.set('visits', parseInt(visits) + 1);
    });
});

// once the app is listening, print on the console is listening.
app.listen(8081, () => {
    console.log('Listening on port 8081 ');
});