class Store {
  final int id;
  final String name;
  final int fileId;
  final int type;

  Store({
    required this.id,
    required this.name,
    required this.fileId,
    required this.type,
  });

  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      id: json['id'],
      name: json['name'],
      fileId: json['id_파일'],
      type: json['id_가맹점타입'],
    );
  }

  @override
  String toString() {
    return 'id: $id, name: $name, fileId: $fileId, type: $type';
  }
}
