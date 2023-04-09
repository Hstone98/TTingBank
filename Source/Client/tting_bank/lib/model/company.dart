// 카드사

class Company {
  int? id;
  String? name;
  int? idFile;

  Company(this.id, this.name, this.idFile);

  Company.empty() {
    this.id = null;
    this.name = '';
    this.idFile = null;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'id_파일': idFile,
    };
  }

  Company.fromJson(Map<String, dynamic> json)
      : id = json['id'] != null ? json['id'] : null,
        name = json['name'] != null ? json['name'] : '',
        idFile = json['id_파일'] != null ? json['id_파일'] : null;
}
