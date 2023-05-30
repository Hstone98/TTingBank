class CardInfo {
  int? id;
  String? cardNumber;
  String? cardPassword;
  String? cardName;

  // 생성자
  CardInfo({
    required this.id,
    required this.cardNumber,
    required this.cardPassword,
    required this.cardName,
  });

  // 초기화
  CardInfo.empty() {
    this.id = null;
    this.cardNumber = "";
    this.cardPassword = "";
    this.cardName = "";
  }

  // json 변경.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      '카드번호': cardNumber,
      '카드비밀번호': cardPassword,
      '카드이름': cardName,
    };
  }

  // 객체에 데이터 넣기.
  CardInfo.fromJson(Map<String, dynamic> json)
      : id = json['id'] != null ? json['id'] : null,
        cardNumber = json['카드번호'] != null ? json['카드번호'] : '',
        cardPassword = json['카드비밀번호'] != null ? json['카드비밀번호'] : '',
        cardName = json['카드이름'] != null ? json['카드이름'] : '';

  @override
  String toString() {
    return 'CardInfo(id: $id, cardNumber: $cardNumber, cardPassword: $cardPassword, cardName: $cardName)';
  }
}
