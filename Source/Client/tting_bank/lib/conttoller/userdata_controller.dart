import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tting_bank/data/search_store.dart';

Future<void> saveUser(String? email, String? name) async {
  final url = "http://121.181.192.82:7777/:users/login";
  final data = {'email': email, 'name': name};
  final body = jsonEncode(data);

  final res = await http.post(
    Uri.parse(url),
    headers: {'Content-Type': 'application/json'},
    body: body,
  );

  if (res.statusCode == 200) {
    print('전송 완료');
  } else if (res.statusCode == 400) {
    print('찾을 수 없음');
    throw Exception('찾을 수 없음');
  } else {
    print('에러 발생');
    throw Exception('에러 발생');
  }
}
