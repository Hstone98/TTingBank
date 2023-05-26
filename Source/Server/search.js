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
router.post('/search', (req, res) => {
  const name = req.body.name;

  //한글 정규식
  const koreanRegex = /[ㄱ-ㅎㅏ-ㅣ가-힣]+/g;
  const matchedKorean = name.match(koreanRegex);
  const searchKeywordKorean = matchedKorean ? matchedKorean.join('') : '';

  // 영어 정규식
  const englishRegex = /[a-zA-Z]+/g;
  const matchedEnglish = name.match(englishRegex);
  const searchKeywordEnglish = matchedEnglish ? matchedEnglish.join('') : '';

  let sql = 'SELECT * FROM tbl_가맹점';

  if (searchKeywordKorean && !searchKeywordEnglish) {
    sql += ' WHERE name REGEXP ?';
    params = [searchKeywordKorean];
  } else if (!searchKeywordKorean && searchKeywordEnglish) {
    sql += ' WHERE name LIKE ?';
    params = [`%${searchKeywordEnglish}%`];
  } else if (searchKeywordKorean && searchKeywordEnglish) {
    sql += ' WHERE name REGEXP ? OR name LIKE ?';
    params = [searchKeywordKorean, `%${searchKeywordEnglish}%`];
  } else {
    res.status(400).json({ message: '검색어를 입력하세요.' });
    return;
  }

  mysqlConnection.query(sql, params, function (error, result, fields) {
    if (error) {
      console.log(error);
      res.status(500).json({ message: '오류가 발생했습니다.' });
    } else {
      if (result.length === 0) {
        res.status(400).json({ message: '찾을 수 없습니다.' });
      } else {
        res.json(result);
      }
    }
  });
});
// =======================================사용자 이름 검색 기능==========================================
router.post('/search/userid', (req, res) =>{
  const name = req.body.name;
  
  let sql = 'SELECT * FROM tbl_사용자 WHERE name = ?';
  let params = [name];

  mysqlConnection.query(sql, params, function(error, result, fields){
    if (error) {
      console.log(error);
      res.status(500).json({ message: '오류가 발생했습니다.' });
    } else {
      if (result.length === 0) {
        res.status(400).json({ message: '찾을 수 없습니다.' });
      } else {
        res.json(result);
        console.log('사용자 데이터 넘김');
      }
    }
  })
});

// =======================================결제내역 조회 기능==========================================
router.post('/search/payment', (req, res) =>{
  const id = req.body.id;
  const year = req.body.year;
  const month = req.body.month;

  const sql = 'SELECT * FROM tbl_사용자_카드_거래내역 WHERE id_사용자 = ? AND SUBSTRING(사용일자, 1, 4) = ? AND SUBSTRING(사용일자, 5, 2) = ?';
  var params = [id, year, month];
  mysqlConnection.query(sql,params, function(error, result, fields){
      if(error)
      {
          res.status(400).json('error ocurred');         
          console.log('들어옴1');
      }
      else{
          if(result.length > 0){
              res.status(200).json(result);
              console.log('결제내역 데이터 조회 성공');
          }
          else{
              res.status(404).json(result);   
              console.log('결제내역 데이터 없음');  
          }
      }
  })
});
// =======================================카드추천 기능==========================================
router.post('/search/recommend', (req, res) => {
  const parameter1 = req.body.email;
  const parameter2 = req.body.company;
  const parameter3 = req.body.label;
  let sql="SELECT * FROM  v_사용자_카드_혜택";

  console.log('전달된 파라미터:', parameter1, parameter2, parameter3);

  if (parameter3 == '할인금액'){
    sql += ' WHERE 이메일 = ? AND 가맹점 = ? AND 할인 IS NOT NULL AND 할인>=100';
  } 
  else if (parameter3 == '할인률'){
    sql += ' WHERE 이메일 = ? AND 가맹점 = ? AND 할인 IS NOT NULL AND 할인<100';
  }
  else if (parameter3 == '적립'){
    sql += ' WHERE 이메일 = ? AND 가맹점 = ? AND 적립 IS NOT NULL';
  }
  else{
    sql += ' WHERE 이메일 = ? AND 가맹점 = ? AND 캐쉬백 IS NOT NULL';
  }

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
// ===================================모든 카드 혜택==========================================
router.post('/search/nocardrecommend', (req, res) => {
  const parameter1 = req.body.company;
  const parameter2 = req.body.label;
  let sql="SELECT * FROM view_혜택";
  console.log('전달된 파라미터:', parameter1);

  if (parameter2 == '할인금액'){
    sql += ' WHERE 가맹점 = ? AND 할인 IS NOT NULL AND 할인 >= 100';
  } 
  else if (parameter2 == '할인률'){
    sql += ' WHERE 가맹점 = ? AND 할인 IS NOT NULL AND 할인 < 100';
  }
  else if (parameter2 == '적립'){
    sql += ' WHERE 가맹점 = ? AND 적립 IS NOT NULL';
  }
  else{
    sql += ' WHERE 가맹점 = ? AND 캐쉬백 IS NOT NULL';
  }

  mysqlConnection.query(sql, [parameter1], function(error, result, fields) {
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