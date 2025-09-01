class UserApi {
  final String id;
  final String name;
  final String email;

  UserApi({required this.id, required this.name, required this.email});

  factory UserApi.fromJson(Map<String, dynamic> user) {
    return UserApi(
      id: user['id'] ?? '',
      name: user['name'] ?? '',
      email: user['email'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
    };
  }
}
