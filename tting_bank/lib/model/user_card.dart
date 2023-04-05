// 사용지 카드

class UserCard {
  int? id;
  int? idUser;
  int? idCard;

  UserCard(this.id, this.idUser, this.idCard);

  UserCard.empty() {
    this.id = null;
    this.idUser = null;
    this.idCard = null;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'id_사용자': idUser,
      'id_카드': idCard,
    };
  }

  UserCard.fromJson(Map<String, dynamic> json)
      : id = json['id'] != null ? json['id'] : null,
        idUser = json['id_사용자'] != null ? json['id_사용자'] : null,
        idCard = json['id_카드'] != null ? json['id_카드'] : null;
}
