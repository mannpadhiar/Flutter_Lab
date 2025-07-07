class User{
  int? id;
  String name;
  String email;

  User({required this.name,required this.email,this.id});

  static Map<String, dynamic> toMap(User user) {
    return {
      'id' : user.id,
      'name' : user.name,
      'email' : user.email,
    };
  }

  static User toUser(Map<String,dynamic> user){
    return User(
      id: user['id'],
      name: user['name'],
      email: user['email']
    );
  }
}