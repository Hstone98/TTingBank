const mysql = require('mysql');
const {Router} = require('express');
const router = Router();

const mysqlConnection = mysql.createConnection({
    host: 'go5home.iptime.org', // rds엔트포인트(aws RDS)
    user: 'capstone',
    password: 'dK4!X!Y(Q6',
    database: 'TTINGCARD_DB'
});

mysqlConnection.connect();

// =======================================사진 db 삽입==========================================
router.post('/:convert', (req,res)=>{
    const imageByteArray = req.body.imageByteArray;
    
    if (imageByteArray) {
        var insertSql = 'INSERT INTO tbl_파일 (byte) VALUES (?)';
        var insertParams = [imageByteArray];
        mysqlConnection.query(insertSql, insertParams, function(error, result, fields) {
          if (error) {
            res.status(400).json('error ocurred');  
            console.log('들어옴2');
          } else {
            res.status(200).json(result);
            console.log('전송 성공');  
          }
        });
      } else {
        res.status(400).json('error ocurred');  
        console.log('imageByteArray is null or undefined');
      }
})

module.exports = router;