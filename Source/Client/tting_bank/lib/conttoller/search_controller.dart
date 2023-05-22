import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tting_bank/data/search_store.dart';

Future<List<Store>> sendData(String name) async {
  final url = "http://121.181.192.82:7777/search/";
  final data = {'name': name};
  final body = jsonEncode(data);

  final res = await http.post(
    Uri.parse(url),
    headers: {"accept": "application/json", "content-type": "application/json"},
    body: body,
  );
  if (res.statusCode == 200) {
    final result = jsonDecode(res.body);
    if (result is List) {
      print(List<Store>.from(result.map((item) => Store.fromJson(item))));
      return List<Store>.from(result.map((item) => Store.fromJson(item)));
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

Future<List<Store>> search(String name) async {
  try {
    List<Store> results = await sendData(name);
    return results;
  } catch (error) {
    print('찾을 수 없음');
    return [];
  }
}
