const express = require('express');
const mysql = require('mysql');

const router = express.Router();

const mysqlConnection = mysql.createConnection({
    host: 'go5home.iptime.org', // RDS endpoint (AWS RDS)
    user: 'capstone',
    password: 'dK4!X!Y(Q6',
    database: 'TTINGCARD_DB'
});

console.log("Code 1");

mysqlConnection.connect();

router.get('/', (req, res) => {
    console.log('Request received');

    const sql = 'SELECT * FROM tbl_카드사';
    mysqlConnection.query(sql, (error, results) => {
        if (error) {
            console.log(error);
            res.status(500).send('Error retrieving data from database');
        } else {
            console.log(results);
            res.json(results);
        }
    });
});

module.exports = router;






// const mysql = require('mysql');
// const {dbCardCompanyRouter} = require('express');
// const router = dbCardCompanyRouter();

// const mysqlConnection = mysql.createConnection({
//     host: 'go5home.iptime.org', // rds엔트포인트(aws RDS)
//     user: 'capstone',
//     password: 'dK4!X!Y(Q6',
//     database: 'TTINGBANK_DB'
// });

// console.log("씨발1");

// mysqlConnection.connect();

// var hw = document.getElementById('btnTest');
// hw.addEventListener('click', function()
// {
//     console.log('들어옴');
//     var sql = 'SELECT * FROM tbl_카드사';
//     mysqlConnection.query(sql, function(error, result)
//     {
//         if(!error)
//         {
//             console.log(result);
//             // res.json(result);
//         }
//         else
//         {
//             console.log(error);
//         }
//     })
// })

// module.exports = router;





// router.post('/:card', (req,res)=>{
//     const name = req.body.name;
//     const idFile = req.body.idFile;
//     const idMemberType = req.body.idMemberType;

//     var sql = 'INSERT INTO tbl_가맹점(name, id_파일, id_가맹점타입) VALUES(?,?,?)';
//     mysqlConnection.query(sql, params, function(error, result)
//     {
//         if(!error)
//         {
//             res.json({result:true, msg:'데이터 삽입 성공'});
//         }
//         else
//         {
//             console.log(error);
//         }
//     })
// })

// router.get('/:card/company/get', (req,res)=>{
//     var sql = 'SELECT * FROM tbl_카드사';
//     mysqlConnection.query(sql, function(error, result)
//     {
//         if(!error)
//         {
//             res.json(result);
//         }
//         else
//         {
//             console.log(error);
//         }
//     })
// })

