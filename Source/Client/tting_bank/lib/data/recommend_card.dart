class Recommend_card {
  final String cdname;
  final String cdnumber;
  final String company;
  final String user;
  final String email;
  final int? discount;
  final int? cashback;
  final int? accumulate;
  final int? id_benefit;
  final String? text;

  Recommend_card({
    required this.cdname,
    required this.cdnumber,
    required this.company,
    required this.user,
    required this.email,
    required this.discount,
    required this.cashback,
    required this.accumulate,
    required this.id_benefit,
    required this.text,
  });

  factory Recommend_card.fromJson(Map<String, dynamic> json) {
    return Recommend_card(
      user: json['사용자'],
      email: json['이메일'],
      cdnumber: json['카드번호'],
      company: json['가맹점'],
      cdname: json['카드이름'],
      discount: json['할인'],
      cashback: json['캐쉬백'],
      accumulate: json['적립'],
      id_benefit: json['id_혜택구간'],
      text: json['기타'],
    );
  }
  @override
  String toString() {
    return 'cdname: $cdname, cdnumber: $cdnumber, company: $company, user: $user, email: $email, discount: $discount, cashback: $cashback, accumulate: $accumulate, id_benefit: $id_benefit, text: $text';
  }
}
