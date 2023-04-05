// 가맹점 타입

class MemberType {
  int? id;
  String? name;

  // 생성자
  MemberType(this.id, this.name);

  // 초기화.
  MemberType.empty() {
    this.id = null;
    this.name = '';
  }

  // json 변경.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  // 객체에 데이터 넣기.
  MemberType.fromJson(Map<String, dynamic> json)
      : id = json['id'] != null ? json['id'] : null,
        name = json['name'] != null ? json['name'] : '';
}
