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

// =======================================검색 기능==========================================
router.post('/testson', (req, res) => {
  const parameter1 = req.body.email;
  const parameter2 = req.body.company;


  console.log('전달된 파라미터:', parameter1, parameter2);

  let sql = 'SELECT * FROM  v_사용자_카드_혜택 WHERE 이메일 = ? AND 가맹점 = ?';
  mysqlConnection.query(sql, [parameter1, parameter2], function(error, result, fields) {
    if(error)
      {
          res.status(400).json('error ocurred');         
          console.log('test1');
      }
      else{
          if(result.length > 0){
              res.status(200).json(result);
              console.log('데이터 성공');
              console.log(result)
          }
          else{
              res.status(404).json('The data does not exist');   
              console.log('데이터 실패');  
          }
      }
    
  });

});

module.exports = router;