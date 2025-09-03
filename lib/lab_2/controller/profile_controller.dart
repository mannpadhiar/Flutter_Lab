import '../model/profile_model.dart';

class UserController{
  UserModel getUsers(Map<String,dynamic> user){
    return UserModel(user['name'],user['address'],user['number'],user['email']);
  }
}