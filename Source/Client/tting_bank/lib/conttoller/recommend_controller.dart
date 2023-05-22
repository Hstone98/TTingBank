import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tting_bank/data/recommend_card.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Recommend_card>> sendData(String name) async {
  final url = "http://121.181.192.82:7777/testson/";
  final data = {'company': name, 'user': '서상윤'};
  final body = jsonEncode(data);

  final res = await http.post(
    Uri.parse(url),
    headers: {"accept": "application/json", "content-type": "application/json"},
    body: body,
  );

  if (res.statusCode == 200) {
    final result = jsonDecode(res.body);
    if (result != null) {
      print(List<Recommend_card>.from(result.map((item) => Recommend_card.fromJson(item))));
      return List<Recommend_card>.from(result.map((item) => Recommend_card.fromJson(item)));
    } else {
      throw Exception('Invalid data format');
    }
  } else if (res.statusCode == 400) {
    print('else if');
    throw Exception('찾을 수 없음');
  } else {
    print('else');
    throw Exception('에러 발생');
  }
}

Future<List<Recommend_card>> recommend(String name) async {
  try {
    List<Recommend_card> results = await sendData(name);
    print('Success');
    return results;
  } catch (error) {
    print('catch error');
    return [];
  }
}
