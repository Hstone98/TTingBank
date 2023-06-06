import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tting_bank/model/card_company.dart';
import 'package:tting_bank/model/user.dart';
import 'package:http/http.dart' as http;

//------------------------------------------------------------------------------------------------//
//
//------------------------------------------------------------------------------------------------//
Future<bool> sendCardAddData(String id, String cardNum, String cardPwd, String organization) async {
  final url = "http://121.181.192.82:7777/addCard";
  final data = {'id': id, 'organization': organization, 'cardNumber': cardNum, 'password': cardPwd};

  final body = jsonEncode(data);

  final res = await http.post(
    Uri.parse(url),
    headers: {"accept": "application/json", "content-type": "application/json"},
    body: body,
  );

  if (res.statusCode == 200) {
    print('성공');
    return true;
  } else if (res.statusCode == 400) {
    print("error code : 400");
    print("잘못된 요청. 서버가 요청의 구문을 인식하지 못했습니다.");
    throw Exception('error code : 400');
  } else if (res.statusCode == 401) {
    print("error code : 401");
    print("권한 없음. 인증실패.");
    throw Exception('error code : 400');
  } else if (res.statusCode == 403) {
    print("error code : 403");
    print("금지됨. 사용자가 리소스에 대한 필요 권한을 가지고 있지 않습니다.");
    throw Exception('error code : 400');
  } else if (res.statusCode == 404) {
    print("error code : 404");
    print("Not Found. 서버가 요청한 페이지를 찾을 수 없습니다.");
    throw Exception('error code : 400');
  } else if (res.statusCode == 500) {
    print("error code : 500");
    print("내부 서버 오류. 서버에 오류가 발생하여 요청을 수행할 수 없습니다.");
    throw Exception('error code : 400');
  } else {
    // 해당 루틴에 접근하면 4xx번대 상태 코드 외 다른 코드 찾아봐야 됨.
    print("에러가 발생했습니다.");
    throw Exception('error 발생!!!');
  }
}

bool checkCardNumLength(int length) {
  if (length < 16) {
    return false;
  }

  return true;
}

bool checkCardPasswordLength(int length) {
  if (length < 2) {
    return false;
  }

  return true;
}

class CardInfoPageController {
  //----------------------------------------------------------------------------------------------//
  //
  //----------------------------------------------------------------------------------------------//
}
