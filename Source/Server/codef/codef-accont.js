const KEY = require("./codef-key")
const {Router} = require('express');
const router = Router();

const {
    EasyCodef,
    EasyCodefConstant,
    EasyCodefUtil,
  } = require('easycodef-node');

var crypto = require("crypto");
var constants = require("constants");

var codef_account_create_url = 'https://development.codef.io/v1/account/create';
var codef_account_add_organization = 'https://api.codef.io/v1/account/add';

// var RSA_password = publicEncRSA(KEY.PUBLIC_KEY, "djWjfkrh1324%");

//------------------------------------------------------------------------------------------------//
// 계정 등록
//------------------------------------------------------------------------------------------------//
function request_create_connected_id_body(countryCode, businessType, clientType, organization, loginType
                                        , id, password, birthDate, loginTypeLevel, clientTypeLevel, cardNo, cardPassword)
{
    return create_accountList;
}
//------------------------------------------------------------------------------------------------//
// Connected ID 추가 -> 처음 발급 받은 Connecte ID에 새로운 은행이나 카드사 추가.
//------------------------------------------------------------------------------------------------//
function request_add_organization_connected_id_body(countryCode, businessType, clientType
                                                    , organization, loginType, id, password
                                                    , birthDate, loginTypeLevel, clientTypeLevel
                                                    , cardNo, cardPassword)
{
    var codef_add_organization_connected_id_body = {
        "accountList": request_create_connected_id_body(countryCode, businessType, clientType
                                                        , organization, loginType, id, password
                                                        , birthDate, loginTypeLevel, clientTypeLevel
                                                        , cardNo, cardPassword),
        "connectedId": ""// TODO : DB에서 가져와라.
    }
    
    return codef_add_organization_connected_id_body;
}
//------------------------------------------------------------------------------------------------//
// (JSON Fomat)create_accountList
//------------------------------------------------------------------------------------------------//
function create_accountList(countryCode, businessType, clientType, organization, loginType
    , id, password, birthDate, loginTypeLevel, clientTypeLevel, cardNo, cardPassword)
{
    RSA_password = publicEncRSA(KEY.PUBLIC_KEY, password);

    return {
        'accountList':[
          {
              "countryCode": countryCode,               // (필수)국가코드
              "businessType": businessType,             // (필수)업무구분 -> 은행,저축은행 : BK / 카드 : CD / 증권 : ST / 보험 : IS
              "clientType": clientType,                 // (필수)고객구분 -> 개인 : P / 기업, 법인 : B / 통합 : A
              "organization": organization,             // (필수)기관코드
              "loginType": loginType,                   // (필수)로그인방식 -> 인증서 : 0 / 아이디, 패스워드 : 1
              "id": id,                                 // (옵션)아이디방식 -> 아이디 방식일 경우 필수/ (키움)복수 계정 보유 고객의 경우 사용
              "password": RSA_password,                 // (필수)인증서 방식일 경우 인증서 패스워드 / 아이디 방식일 경우 아이디 패스우드 입력
              "birthDate": birthDate,                   // (옵션)생년월일
              //"loginTypeLevel": loginTypeLevel,       // (옵션)신한/롯데 법인카드의 경우 [로그인구분] 이용자 : 0 / 사업장/부서관리자 : 1 / 총괄관리자 : 2. (default : 2)
              //"clientTypeLevel": clientTypeLevel,     // (옵션)신한 법인카드의 경우 [회원구분] 신용카드 회원 : 0 / 체크카드 회원 : 1 / 연구비 신용카드 회원 : 2
              //"cardNo": cardNo,                       // (옵션)KB카드 소지확인 인증이 필요한 경우 필수 : 마스킹 없는 전체 카드번호 입력
              //"cardPassword": cardPassword,           // (옵션)KB카드 소지확인 필요한 경우 : 카드 비밀번호 앞 2자리
          }
        ]
    };
}
//------------------------------------------------------------------------------------------------//
// 비밀번호 암호화 -> codef에서 제공하는 public key로 RSA암호화 한 후, api 서버로 요청해야됨.
//------------------------------------------------------------------------------------------------//
function publicEncRSA(publicKey, data) {
    console.log(publicKey);

    var pubkeyStr = "-----BEGIN PUBLIC KEY-----\n" + publicKey + "\n-----END PUBLIC KEY-----";
    var bufferToEncrypt = new Buffer(data);
    var encryptedData = crypto.publicEncrypt({"key" : pubkeyStr, padding : constants.RSA_PKCS1_PADDING},bufferToEncrypt).toString("base64");

    console.log(encryptedData); 

    return encryptedData;
};

module.exports = router;