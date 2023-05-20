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

module.exports = router;