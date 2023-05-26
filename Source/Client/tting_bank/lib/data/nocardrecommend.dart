class NoCardRecommend {
  final String cdname;
  final String company;
  final int? discount;
  final int? cashback;
  final int? accumulate;
  final int? id_benefit;
  final String? text;

  NoCardRecommend({
    required this.cdname,
    required this.company,
    required this.discount,
    required this.cashback,
    required this.accumulate,
    required this.id_benefit,
    required this.text,
  });

  factory NoCardRecommend.fromJson(Map<String, dynamic> json) {
    return NoCardRecommend(
      cdname: json['카드'],
      company: json['가맹점'],
      id_benefit: json['id_혜택구간'],
      discount: json['할인'],
      cashback: json['캐쉬백'],
      accumulate: json['적립'],
      text: json['기타'],
    );
  }
  @override
  String toString() {
    return 'cdname: $cdname, company: $company, discount: $discount, cashback: $cashback, accumulate: $accumulate, id_benefit: $id_benefit, text: $text';
  }
}
