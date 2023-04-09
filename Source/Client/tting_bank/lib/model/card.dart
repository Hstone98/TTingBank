// 카드

class Card {
  int? id;
  String? name;
  int? lastMonthValue;
  int? point;
  int? idFile;
  int? idCompany;
  int? idCardType;

  // 생성자
  Card(this.id, this.name, this.lastMonthValue, this.point, this.idFile,
      this.idCompany);

  // 초기화
  Card.empty() {
    this.id = null;
    this.name = "";
    this.lastMonthValue = 0;
    this.point = 0;
    this.idFile = null;
    this.idCompany = null;
  }

  // json 변경.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      '전월실적': lastMonthValue,
      '포인트': point,
      'id_파일': idFile,
      'id_카드사': idCompany,
      'id_카드타입': idCardType,
    };
  }

  // 객체에 데이터 넣기.
  Card.fromJson(Map<String, dynamic> json)
      : id = json['id'] != null ? json['id'] : null,
        name = json['name'] != null ? json['name'] : '',
        lastMonthValue = json['전월실적'] != null ? json['전월실적'] : '',
        point = json['포인트'] != null ? json['포인트'] : '',
        idFile = json['id_파일'] != null ? json['id_파일'] : '',
        idCompany = json['id_카드사'] != null ? json['id_카드사'] : '',
        idCardType = json['id_카드타입'] != null ? json['id_카드타입'] : '';
}
