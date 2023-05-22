class Recommend_card {
  final String cdname;
  final String cdnumber;
  final String company;
  final String user;

  // final int id_discount;
  // final int id_accumulate;
  // final int id_cashback;
  // final int discount_rate;
  // final int discount_amount;
  // final int accumulate_rate;
  // final int cashback_amount;


  Recommend_card({
    required this.cdname,
    required this.cdnumber,
    required this.company,
    required this.user,
    // required this.id_discount,
    // required this.id_accumulate,
    // required this.id_cashback,
    // required this.discount_rate,
    // required this.discount_amount,
    // required this.accumulate_rate,
    // required this.cashback_amount,
  });

  factory Recommend_card.fromJson(Map<String, dynamic> json) {
    return Recommend_card(
      cdname: json['카드이름'],
      cdnumber: json['카드번호'],
      company: json['가맹점'],
      user: json['사용자'],
      // id_discount: json['id_할인'],
      // id_accumulate: json['id_적립'],
      // id_cashback: json['id_캐쉬백'],
      // discount_rate: json['할인율'],
      // discount_amount: json['할인금액'],
      // accumulate_rate: json['적립율'],
      // cashback_amount: json['캐쉬백원'],
    );
  }
  @override
  String toString() {
    return 'cdname: $cdname, cdnumber: $cdnumber, company: $company, user: $user';
  }

  // @override
  // String toString() {
  //   return 'id: $id, cdname: $cdname, company: $company, id_discount: $id_discount, id_accumulate: $id_accumulate, id_cashback: $id_cashback, '
  //       'discount_rate: $discount_rate, discount_amount: $discount_amount, accumulate_rate: $accumulate_rate, cashback_amount: $cashback_amount';
  // }
}
