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

// =======================================로그인 및 회원가입==========================================
router.post('/:users/login', (req,res)=>{
    const email = req.body.email;
    const name = req.body.name;
    
    var sql =  'SELECT * FROM tbl_사용자 WHERE email = ?';
    var params = [email];
    mysqlConnection.query(sql, params, function(error, result, fields)
    {
        if(error)
        {
            res.status(400).json('error ocurred');         
            console.log('들어옴1');  
        }
        else
        {
            if(result.length > 0 ){
                if(result[0].email == params[0])
                {
                    res.status(200).json(result);
                    console.log('로그인 성공');  
                }
                else{
                    res.status(204).json('Email does not match');   
                    console.log('로그인 실패: 이메일이 일치하지 않음');  
                }
            }
            else
            {
                var insertSql = 'INSERT INTO tbl_사용자 (email, name) VALUES (?, ?)';
                var insertParams = [email, name];
                console.log(email, name);
                mysqlConnection.query(insertSql, insertParams, function(error, result, fields) {
                    if (error) {
                        res.status(400).json('error ocurred');  
                        console.log('들어옴2');
                    } else {
                        res.status(200).json(result);
                        console.log('회원가입 성공');  
                    }
                });
            }
        }
    });
// =============================회원탈퇴=========================================
router.post('/:users/withdrawal', (req, res) => {
    const email = req.body.email;
  
    const sql = 'DELETE FROM tbl_사용자 WHERE email = ?';
    const params = [email];
  
    mysqlConnection.query(sql, params, function(error, result, fields) {
      if (error) {
        res.status(500).json('Error occurred');
        console.log('log1');
      } else {
        if (result.affectedRows === 0) {
          res.status(400).json('회원을 찾을 수 없음');
        } else {
          res.status(200).json('회원탈퇴 성공');
          console.log('console log');
        }
      }
    });
  });
})

module.exports = router;