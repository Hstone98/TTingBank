import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tting_bank/data/search_store.dart';
import 'package:tting_bank/model/card_info.dart';

Future<List<CardInfo>> sendData(int id) async {
  final url = "http://121.181.192.82:7777/search/usercard";
  final data = {'id': id};
  final body = jsonEncode(data);
  print(data);
  final res = await http.post(
    Uri.parse(url),
    headers: {"accept": "application/json", "content-type": "application/json"},
    body: body,
  );
  if (res.statusCode == 200) {
    final result = jsonDecode(res.body);
    if (result is List) {
      print(result);
      return List<CardInfo>.from(result.map((item) => CardInfo.fromJson(item)));
    } else {
      throw Exception('Invalid data format');
    }
  } else if (res.statusCode == 400) {
    print('찾을 수 없음');
    throw Exception('찾을 수 없음');
  } else {
    print('에러 발생');
    throw Exception('에러 발생');
  }
}

Future<List<CardInfo>> userCard(int id) async {
  try {
    List<CardInfo> results = await sendData(id);
    return results;
  } catch (error) {
    print('찾을 수 없음');
    return [];
  }
}
