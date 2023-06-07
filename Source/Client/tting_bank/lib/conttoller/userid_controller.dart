import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tting_bank/model/user.dart';

Future<User> searchUser(String? name) async {
  final url = "http://121.181.192.82:7777/search/userid";
  final data = {'name': name};
  final body = jsonEncode(data);
  print(name);
  final res = await http.post(
    Uri.parse(url),
    headers: {'Content-Type': 'application/json'},
    body: body,
  );

  if (res.statusCode == 200) {
    final result = jsonDecode(res.body);
    final userData = result[0];
    final sendUserData = User.fromJson(userData);

    // Server로 UserId 전달.
    SendUserId(sendUserData.id);

    print('전송 완료');
    print(userData);

    return sendUserData;
  } else if (res.statusCode == 400) {
    print('찾을 수 없음');

    throw Exception('찾을 수 없음');
  } else {
    print('에러 발생');
    throw Exception('에러 발생');
  }
}

//------------------------------------------------------------------------------------------------//
//KakaoName()에서 받아온 이름을 searchUser로 보내고 User 형태로 return
//------------------------------------------------------------------------------------------------//
Future<User> userSet(String? name) async {
  User user;
  try {
    user = await searchUser(name);

    return user;
  } catch (error) {
    print('찾을 수 없음');
    return user = User(id: 0, name: '', email: '', connected_id: '');
  }
}

//------------------------------------------------------------------------------------------------//
//
//------------------------------------------------------------------------------------------------//
Future<bool> SendUserId(int userId) async {
  final url = "http://121.181.192.82:7777/getId";

  final data = {'id': userId};

  final body = jsonEncode(data);

  print('들어옴?');

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
