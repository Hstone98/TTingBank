import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tting_bank/model/consumption.dart';
import 'package:tting_bank/view/setting_page.dart';

Future<List<Consumption>> consumptionData(
    int id, String year, String month) async {
  final url = "http://121.181.192.82:7777/search/payment";
  final data = {'id': id, 'year': year, 'month': month};
  final body = jsonEncode(data);

  final res = await http.post(
    Uri.parse(url),
    headers: {"accept": "application/json", "content-type": "application/json"},
    body: body,
  );
  if (res.statusCode == 200) {
    final result = jsonDecode(res.body);
    if (result is List) {
      print(List<Consumption>.from(
          result.map((item) => Consumption.fromJson(item))));
      return List<Consumption>.from(
          result.map((item) => Consumption.fromJson(item)));
    } else {
      throw Exception('Invalid data format');
    }
  } else if (res.statusCode == 404) {
    final result = jsonDecode(res.body);
    if (result is List) {
      print(List<Consumption>.from(
          result.map((item) => Consumption.fromJson(item))));
      return List<Consumption>.from(
          result.map((item) => Consumption.fromJson(item)));
    } else {
      throw Exception('Invalid data format');
    }
  } else {
    print(res.statusCode);
    print('에러 발생');
    throw Exception('에러 발생');
  }
}

//거래내역을 조회해서 Consumption형태를 List에 담기
Future<List<Consumption>> consumptionListSet(
    int userId, String yearString, String monthString) async {
  try {
    List<Consumption> list =
        await consumptionData(userId, yearString, monthString);
    return list;
  } catch (error) {
    print('찾을 수 없음');
    return [];
  }
}
