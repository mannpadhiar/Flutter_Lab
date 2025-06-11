import '../model/user_model.dart';

class UserProfileController{

  static User user = User();

  void setDetails(String name,String email,String number){
    user.name = name;
    user.email = email;
    user.number = number;
  }
}