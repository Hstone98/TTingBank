const {Router} = require('express');
const router = Router();

const {
    EasyCodef,
    EasyCodefConstant,
    EasyCodefUtil,
  } = require('easycodef-node');

var https = require("https");
var parse = require("url-parse");
var urlencode = require("urlencode");


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