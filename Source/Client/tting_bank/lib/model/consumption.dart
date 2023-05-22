class Consumption {
  final int id;
  final String date;
  final String time;
  final String name;
  final int amount;
  final int cardid;
  final int userid;

  Consumption(
      {required this.id,
      required this.date,
      required this.time,
      required this.name,
      required this.amount,
      required this.cardid,
      required this.userid});

  factory Consumption.fromJson(Map<String, dynamic> json) {
    return Consumption(
      id: json['id'],
      date: json['사용일자'],
      time: json['사용일시'],
      name: json['가맹점명'],
      amount: json['결제금액'],
      cardid: json['id_사용자_카드'],
      userid: json['id_사용자'],
    );
  }

  @override
  String toString() {
    return 'date: $date, time: $time, type: $name, amount: $amount';
  }
}
