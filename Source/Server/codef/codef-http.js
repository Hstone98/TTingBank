const {Router} = require('express');
const router = Router();
const KEY = require('./codef-key.js')
const codef_token = require('./codef-token.js');

var https = require("https");
var parse = require("url-parse");
var urlencode = require("urlencode");

var codef_url = "https://development.codef.io";
var account_list_path = "/v1/kr/bank/p/account/account-list";

var token_url = "https://oauth.codef.io/oauth/token";

var codef_api_body = {
  connectedId: "", // Example of Connected ID issued after end user's bank/card company account registration
  organization: ""
};

var token = "";

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

// CODEF API Callback
var codefApiCallback = function(response) {
  console.log("codefApiCallback Status: " + response.statusCode);
  console.log("codefApiCallback Headers: " + JSON.stringify(response.headers));

  var body = "";
  response.setEncoding("utf8");
  response.on("data", function(data) {
    body += data;
  });

  // end 이벤트가 감지되면 데이터 수신을 종료하고 내용을 출력한다
  response.on("end", function() {
    console.log("codefApiCallback body:" + urlencode.decode(body));

    // 데이저 수신 완료
    if (response.statusCode == 200) {
      console.log("정상처리");
    } else if (response.statusCode == 401) {
      codef_token.requestToken(
        token_url,
        KEY.DEMO_CLIENT_ID,
        KEY.DEMO_CLIENT_SECRET
      );
    } else {
      console.log("API 요청 오류");
    }
  });
};


// httpSender(codef_url + account_list_path, token, codef_api_body);

module.exports = router;