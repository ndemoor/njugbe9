var express = require('express'),
    Memcached = require('memcached'),
    fs = require('fs');

// Constants
var port = 3000;
var env = process.env.NODE_ENV || 'production';
var mc = new Memcached(process.env.MC_PORT ? process.env.MC_PORT.replace('tcp://', '') : null);

// App
var app = express();
app.use(express.urlencoded());

// Root path
app.get('/', function (req, res) {
  res.send('Hello World!!\n');
});

// Myval path
app.post('/myval', function (req, res) {
  fs.appendFile('/var/log/app/values.log', req.body.value + '\n', function (err) {});

  mc.set('foo', req.body.value, 3600, function (err) {
    if(err) {
      res.send('Could not set value\n', 500);
    } else {
      res.send('Value set!\n')
    }
  });
});

app.get('/myval', function (req, res) {
  mc.get('foo', function (err, data) {
    if(err) {
      res.send('Could not get value\n', 500);
    } else {
      res.send('Value = ' + data + '\n');
    }
  });
});

app.listen(port);

console.log('Running in ' + env + ' on http://localhost:' + port);
