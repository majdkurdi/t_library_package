class User {
  final int id;
  final String name;
  final String phoneNumber;
  final String address;
  // final String password;
  final String email;

  User(
      {required this.name,
      required this.email,
      required this.phoneNumber,
      required this.address,
      required this.id});

  factory User.fromJson(Map<String, dynamic> data) {
    return User(
        name: data['name'] as String,
        email: data['email'] as String,
        id: data['id'] as int,
        phoneNumber: data['phone_number'] as String,
        address: data['address'] as String);
  }
}
