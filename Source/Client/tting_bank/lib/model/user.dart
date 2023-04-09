// 가맹점 타입

class User {
  int? id;
  String? email;

  // 생성자
  User(this.id, this.email);

  // 초기화.
  User.empty() {
    this.id = null;
    this.email = '';
  }

  // json 변경.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
    };
  }

  // 객체에 데이터 넣기.
  User.fromJson(Map<String, dynamic> json)
      : id = json['id'] != null ? json['id'] : null,
        email = json['email'] != null ? json['email'] : '';
}
