class User {
  final int id;
  final String name;
  final String email;
  final String? connected_id;

  User({required this.id, required this.name, required this.email, required this.connected_id});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      connected_id: json['connected_id'],
    );
  }
}
