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
    print('전송 완료');
    print(userData);
    return User.fromJson(userData);
  } else if (res.statusCode == 400) {
    print('찾을 수 없음');
    throw Exception('찾을 수 없음');
  } else {
    print('에러 발생');
    throw Exception('에러 발생');
  }
}
