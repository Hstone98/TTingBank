const {Router} = require('express');
const router = Router();

const {
    EasyCodef,
    EasyCodefConstant,
    EasyCodefUtil,
  } = require('easycodef-node');

let token;

const path = require('path');

//코드에프 가입을 통해 발급 받은 클라이언트 정보 - 데모
const DEMO_CLIENT_ID = 'e25fbc18-4d8e-4647-8c19-9fe241a59fd1';
const DEMO_CLIENT_SECRET = '5eeec16b-fb4a-4d60-85bc-55ab4ab8ce76';

// 코드에프 가입을 통해 발급 받은 클라이언트 정보- 정식
const CLIENT_ID = '';
const CLIENT_SECRET = '';

//	코드에프 가입을 통해 발급 받은 RSA 공개키 정보
const PUBLIC_KEY = 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAsPUBYBaCoHfnZA0vjfbArkiHts8SBVx1NCiSRmwVuKV341Oj80Csyx0mUdnv3agIRPG3puYMi2wbe+ZCAjXA7rttKN1rldidAcbqdth+tuL9WAVr4wPJ3eCJVkulghN7Gx5Y0bQr1YB3s/2rY87R17D/uFI0hjfF5ZmUtSFbLk2jh+MY1ToM+vQfrwlQNfTpNljjR6Hkd1lRKuDjth1z/KsEwP75baASRV+Pj4RePJE8u2Pqt4vYrLHMhnbOwVtuNSirG82sgJjgrq8QB2Jl71yYzwpg1UABOs7CrNbvtNm9xTswzTIXf7mQpPncryvk7To3d7QniWwUqLuiC4SzwQIDAQAB';

/*
 *#1.쉬운 코드에프 객체 생성
 */
const codef = new EasyCodef();

/*
 *#2.RSA암호화를 위한 퍼블릭키 설정
 * - 데모/정식 서비스 가입 후 코드에프 홈페이지에 확인 가능(https://codef.io/#/account/keys)
 * - 암호화가 필요한 필드에 사용 - encryptValue(String plainText);
 */
codef.setPublicKey(PUBLIC_KEY);

/*
 *#3.데모 클라이언트 정보 설정
 * - 데모 서비스 가입 후 코드에프 홈페이지에 확인 가능(https://codef.io/#/account/keys)
 * - 데모 서비스로 상품 조회 요청시 필수 입력 항목
 */
codef.setClientInfoForDemo(DEMO_CLIENT_ID, DEMO_CLIENT_SECRET);

/*
 * #4.정식 클라이언트 정보 설정
 * - 정식 서비스 가입 후 코드에프 홈페이지에 확인 가능(https://codef.io/#/account/keys)
 * - 정식 서비스로 상품 조회 요청시 필수 입력 항목
 */
codef.setClientInfo(CLIENT_ID, CLIENT_SECRET);

/*#5.요청
 *  - 샌드박스 : EasyCodefConstant.SERVICE_TYPE_SANDBOX
 *  - 데모 : EasyCodefConstant.SERVICE_TYPE_DEMO
 *  - 운영 : EasyCodefConstant.SERVICE_TYPE_API
 */
codef
  .requestToken(EasyCodefConstant.SERVICE_TYPE_DEMO)
  .then(function (response) {
    /*
     * #6. 토큰 발급 결과
     */
    token = response;
    console.log(token);
  });

var crypto = require("crypto");
var constants = require("constants");
var https = require("https");
var parse = require("url-parse");
var urlencode = require("urlencode");



function publicEncRSA(publicKey, data) {
  var pubkeyStr = "-----BEGIN PUBLIC KEY-----\n" + publicKey + "\n-----END PUBLIC KEY-----";
  var bufferToEncrypt = new Buffer(data);
  var encryptedData = crypto.publicEncrypt({"key" : pubkeyStr, padding : constants.RSA_PKCS1_PADDING},bufferToEncrypt).toString("base64");

  console.log(encryptedData); 

  return encryptedData;
};



var httpSender = function(url, token, body) {
  console.log("========== httpSender ========== ");
  var uri = parse(url, true);

  var request = https.request(
    {
      hostname: uri.hostname,
      path: uri.pathname,
      port: uri.port,
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Authorization: "Bearer " + token
      }
    },
    codefApiCallback
  );
  request.write(JSON.stringify(body));
  request.end();
};







var codef_account_create_url = 'https://api.codef.io/v1/account/create'
var codef_account_create_body = {
            'accountList':[                  // 계정목록
              {
                  'countryCode':'KR',        //# 국가코드
                  'businessType':'BK',       //# 비즈니스 구분
                  'clientType':'P',          //# 고객구분(P: 개인, B: 기업)
                  'organization':'0003',     //# 기관코드
                  'loginType':'0',           //# 로그인타입 (0: 인증서, 1: ID/PW)
                  'password':publicEncRSA(PUBLIC_KEY, '1234'),    //# 엔드유저의 인증서 비밀번호 입력
                  
              }
            ]
};



// # CODEF API 호출
httpSender(codef_account_create_url, token, codef_account_create_body);
























module.exports = router;