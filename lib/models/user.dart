class User {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String username;
  final String address;
  final String company;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.username,
    required this.address,
    required this.company,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    final addressJson = json['address'] ?? {};
    final companyJson = json['company'] ?? {};

    String fullAddress =
        "${addressJson['street'] ?? ''}, ${addressJson['suite'] ?? ''}, ${addressJson['city'] ?? ''} - ${addressJson['zipcode'] ?? ''}";

    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      username: json['username'] ?? '',
      address: fullAddress,
      company: companyJson['name'] ?? '',
    );
  }
}
