// 카드 타입.

class CardType {
  int? id;
  String? type;

  CardType(this.id, this.type);

  CardType.empty() {
    this.id = null;
    this.type = '';
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
    };
  }

  CardType.fromJson(Map<String, dynamic> json)
      : id = json['id'] != null ? json['id'] : null,
        type = json['type'] != null ? json['type'] : '';
}
