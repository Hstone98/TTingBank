// 카드 타입.

class File {
  int? id;
  String? path;

  File(this.id, this.path);

  File.empty() {
    this.id = null;
    this.path = '';
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'path': path,
    };
  }

  File.fromJson(Map<String, dynamic> json)
      : id = json['id'] != null ? json['id'] : null,
        path = json['path'] != null ? json['path'] : '';
}
