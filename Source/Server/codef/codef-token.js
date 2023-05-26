const {Router} = require('express');
const router = Router();
const KEY = require("./codef-key")

var https = require("https");
var parse = require("url-parse");
var urlencode = require("urlencode");

// 기 발급된 토큰
var token = "";

//------------------------------------------------------------------------------------------------//
// Token 재발급 -> codef-http.js에서 api 서버에 http 요청 시, 토큰 없으면 호출,
//------------------------------------------------------------------------------------------------//
var requestToken = function(url, client_id, client_secret) 
{
    console.log("========== requestToken ========== ");
    console.log("나왔슈~");
    var uri = parse(url);
  
    var authHeader = new Buffer(client_id + ":" + client_secret).toString(
      "base64"
    );
  
    var request = https.request(
      {
        hostname: uri.hostname,
        path: uri.pathname,
        port: uri.port,
        method: "POST",
        headers: {
          Acceppt: "application/json",
          "Content-Type": "application/x-www-form-urlencoded",
          Authorization: "Basic " + authHeader
        }
      },
      authTokenCallback
    );
    request.write("grant_type=client_credentials&scope=read");
    request.end();
  };
//------------------------------------------------------------------------------------------------//
// Auth Token Callback
//------------------------------------------------------------------------------------------------//
var authTokenCallback = function(response) {
    console.log("authTokenCallback Status: " + response.statusCode);
    console.log("authTokenCallback Headers: " + JSON.stringify(response.headers));

    var body = "";
    response.setEncoding("utf8");
    response.on("data", function(data) {
        body += data;
    });

    // end 이벤트가 감지되면 데이터 수신을 종료하고 내용을 출력한다
    response.on("end", function() {
        // 데이저 수신 완료
        console.log("authTokenCallback body = " + body);
        token = JSON.parse(body).access_token;
        if (response.statusCode == 200) {
        console.log("토큰발급 성공");
        console.log("token = " + token);

        // CODEF API 요청
        // Create ConnectedId
        // httpSender(codef_account_create_url, token, codef_account_create_body);
        // httpSender(codef_is_card_url, token, codef_card_body);  
        // httpSender(codef_card_url, token, codef_card_body);
        } else {
        console.log("토큰발급 오류");
        }
    });
};

module.exports = router;