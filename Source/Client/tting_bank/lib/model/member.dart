// 가맹점

class Member {
  int? id;
  String? name;
  int? idFile;
  int? idMemberType;

  // 생성자
  Member(this.id, this.name, this.idFile, this.idMemberType);

  // 초기화.
  Member.empty() {
    this.id = null;
    this.name = '';
    this.idFile = null;
    this.idMemberType = null;
  }

  // json 변경.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'id_파일': idFile,
      'id_가맹점타입': idMemberType,
    };
  }

  // 객체에 데이터 넣기.
  Member.fromJson(Map<String, dynamic> json)
      : id = json['id'] != null ? json['id'] : null,
        name = json['name'] != null ? json['name'] : '',
        idFile = json['id_파일'] != null ? json['id_파일'] : null,
        idMemberType = json['id_가맹점타입'] != null ? json['id_가맹점타입'] : null;
}
