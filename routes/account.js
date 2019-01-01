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


app.post('/preparecashout', function(req, res, next) {
    var data = {
        iduser: req.body.iduser,
        amount: req.body.amount,
        account: req.body.account,
        date: req.body.date,
    }
    req.getConnection(function(error, conn) {
        conn.query('INSERT INTO preparedcashout SET ?', data, function(err, rows, fields) {
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

app.post('/getcashoutbyid', function(req, res, next) {
    var id =req.body.iduser;
    req.getConnection(function(error, conn) {
        conn.query('SELECT * FROM preparedcashout WHERE iduser = '+id,function(err, rows, fields) {
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

app.post('/docashouts', function(req, res, next) {
   
    req.getConnection(function(error, conn) {
        conn.query('SELECT * FROM preparedcashout' ,function(err, rows1, fields) {
            //if(err) throw err
            if (err) {
                req.flash('error', err)
                res.status(400).send(err);
            } else {
                var account = rows1[0].account;
                var amount = rows1[0].amount;
               conn.query('DELETE FROM preparedcashout WHERE idcashout = '+rows1[0].idcashout ,function(err, rows2, fields) {
                    //if(err) throw err
                    if (err) {
                        req.flash('error', err)
                        res.status(400).send(err);
                    } else {
                       
                    }
                });
                conn.query('SELECT * FROM transaction where idaccount = '+account+' ORDER BY date DESC LIMIT 1',function(err, rows3, fields) {
                    //if(err) throw err
                    if (err) {
                        req.flash('error', err)
                        res.status(400).send(err);
                    } else {
                        console.log(rows3);
                        conn.query('UPDATE account SET queued='+(rows3[0].total-amount)+', total='+(rows3[0].total-amount)+' WHERE idaccount='+ account,function(err, rows, fields) {
                            //if(err) throw err
                            if (err) {
                                req.flash('error', err)
                                res.status(400).send(err);
                            } else {
                                //res.send(JSON.stringify(rows));  
                            }
                        });
                       conn.query('INSERT INTO transaction (description, amount, date, total, idaccount) VALUES ("Withdraw ATM", '+amount+', now(), '+(rows3[0].total-amount)+','+account+')',function(err, rows, fields) {
                            //if(err) throw err
                            if (err) {
                                req.flash('error', err)
                                res.status(400).send(err);
                            } else {
                                res.send(JSON.stringify(rows));  
                            }
                        });
                    }
                });
              
            }
        });
    });
});


app.post('/getcashouts', function(req, res, next) {
    var id =req.body.id;
    req.getConnection(function(error, conn) {
        conn.query('SELECT * FROM preparedcashout' ,function(err, rows, fields) {
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

app.post('/deletecashout', function(req, res, next) {
    var id =req.body.iduser;
    req.getConnection(function(error, conn) {
        conn.query('DELETE FROM preparedcashout WHERE iduser = '+id,function(err, rows, fields) {
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