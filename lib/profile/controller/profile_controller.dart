import 'package:sem_5/profile/model/profile_model.dart';
class ProfileController{

  ProfileModel profileModel = ProfileModel();

  String? validateName(String? value){
    return profileModel.validateName(value);
  }

  String? validateEmail(String? value){
    return profileModel.validateEmail(value);
  }

  String? validateNumber(String? value){
    return profileModel.validateNumber(value);
  }

  String? validatePassword(String? value){
    return profileModel.validatePassword(value);
  }
}