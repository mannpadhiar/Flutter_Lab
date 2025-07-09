class UserApi{
  String id;
  String name;
  String city;

  UserApi({required this.name,required this.city,required this.id});

  static Map<String, dynamic> toMap(UserApi user) {
    return {
      'id' : user.id,
      'name' : user.name,
      'email' : user.city,
    };
  }

  factory UserApi.fromMap(Map<String,dynamic> user){
    return UserApi(
        id: user['id'],
        name: user['name'],
        city: user['city']
    );
  }
}