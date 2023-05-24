const {Router} = require('express');
const router = Router();


const {
    EasyCodef,
    EasyCodefConstant,
    EasyCodefUtil,
  } = require('easycodef-node');

// auth 2.0 인증
var crypto = require("crypto");
var constants = require("constants");
var https = require("https");
var parse = require("url-parse");
var urlencode = require("urlencode");

var codef_api = {
    connectedId: "d6V8q-BHQ06aWcJmAm6yds", // 엔드유저의 은행/카드사 계정 등록 후 발급받은 커넥티드아이디 예시
    organization: "0003"
  };

// ========== HTTP 기본 함수 ==========
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
    request.write(urlencode.encode(JSON.stringify(body)));
    request.end();
  };
  // ========== HTTP 함수  ==========

module.exports = router;