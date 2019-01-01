var express = require('express')
var app = express()
 
app.post('/login', function(req, res, next) {
    var username =req.body.username;
    var password =req.body.password;
    console.log(req.body,username,password);
    req.getConnection(function(error, conn) {
        conn.query('SELECT * FROM user WHERE username = "'+username+'" AND password = "'+password+'"', function(err, rows, fields) {
            //if(err) throw err
            if (err) {
                req.flash('error', err)
                res.status(400).send(err);
            } else {
                // render to views/user/list.ejs template file
                res.send(JSON.stringify(rows));
            }
        });
    });
});

app.post('/register', function(req, res, next) {
    var user = {
        username: req.body.username,
        password: req.body.username,
        name: req.body.name,
        impairments: req.body.impairments,
        experience: req.body.experience
    }
    req.getConnection(function(error, conn) {
        conn.query('INSERT INTO user SET ?', user, function(err, rows, fields) {
            //if(err) throw err
            if (err) {
                req.flash('error', err)
                res.status(400).send(err);
            } else {
                // render to views/user/list.ejs template file
                res.send(JSON.stringify(rows));
            }
        });
    });
});

app.post('/updatedata', function(req, res, next) {
    req.getConnection(function(error, conn) {
        conn.query('UPDATE user SET impairments="'+req.body.impairments+'", experience="'+req.body.experience+ '" WHERE iduser ="'+ req.body.iduser+'"', function(err, rows, fields) {
            //if(err) throw err
            if (err) {
                req.flash('error', err)
                res.status(400).send(err);
            } else {
                // render to views/user/list.ejs template file
                res.send(JSON.stringify(rows));
            }
        });
    });
});


module.exports = app;