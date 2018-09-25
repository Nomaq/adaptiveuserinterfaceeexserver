var express = require('express')
var app = express()
 
app.post('/byuserid', function(req, res, next) {
    var id =req.body.userid;
    req.getConnection(function(error, conn) {
        conn.query('SELECT * FROM account WHERE userid = '+id+' ORDER BY idaccount ASC',function(err, rows, fields) {
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

// SHOW LIST OF USERS
app.post('/gettransactionsid', function(req, res, next) {
    var id =req.body.accountid;
    req.getConnection(function(error, conn) {
        conn.query('SELECT * FROM transaction WHERE idaccount = '+id+' ORDER BY date DESC',function(err, rows, fields) {
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

module.exports = app