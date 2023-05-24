class CardCompany {
  final String id;
  final String password;

  CardCompany({required this.id, required this.password});

  factory CardCompany.fromJson(Map<String, dynamic> json) {
    return CardCompany(id: json['id'], password: json['password']);
  }
}
