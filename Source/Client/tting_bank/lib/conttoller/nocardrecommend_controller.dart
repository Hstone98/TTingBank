import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:tting_bank/data/nocardrecommend.dart';

Future<List<NoCardRecommend>> sendData(String company, String label) async {
  final url = "http://121.181.192.82:7777/search/nocardrecommend/";
  final data = {'company': company, 'label': label};
  final body = jsonEncode(data);

  final res = await http.post(
    Uri.parse(url),
    headers: {"accept": "application/json", "content-type": "application/json"},
    body: body,
  );

  if (res.statusCode == 200) {
    final result = jsonDecode(res.body);
    if (result != null) {
      return List<NoCardRecommend>.from(
          result.map((item) => NoCardRecommend.fromJson(item)));
    } else {
      throw Exception('Invalid data format');
    }
  } else if (res.statusCode == 404) {
    final result = jsonDecode(res.body);
    if (result == null) {
      print('404');
      return [];
    } else {
      return List<NoCardRecommend>.from(
          result.map((item) => NoCardRecommend.fromJson(item)));
    }
  } else {
    print(res.statusCode);
    throw Exception('에러 발생');
  }
}

Future<List<NoCardRecommend>> nocardrecommend(String company, String label) async {
  try {
    List<NoCardRecommend> results = await sendData(company, label);
    return results;
  } catch (error) {
    print('catch error');
    return [];
  }
}
