const mysql = require('mysql');
const {Router} = require('express');
const router = Router();

const mysqlConnection = mysql.createConnection({
    host: 'go5home.iptime.org', // rds엔트포인트(aws RDS)
    user: 'capstone',
    password: 'dK4!X!Y(Q6',
    database: 'TTINGBANK_DB'
});

mysqlConnection.connect();

// =======================================검색 기능==========================================
router.get('/:search', (req,res)=>{
    let name = req.params.search;
    
    let sql =  'SELECT * FROM 가맹점 WHERE name REGEXP ?';
    let params = [name];
    mysqlConnection.query(sql, params, function(error, result, fields)
    {
        if(error)
        {
            res.status(400).json('error ocurred');         
            console.log('들어옴1');  
        }
        else
        {
            res.send(result);
            console.log('들어옴2');
        }
    });
})

module.exports = router;