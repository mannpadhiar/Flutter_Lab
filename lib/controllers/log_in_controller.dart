
import '../models/log_in_models.dart';

class LogInController{

  LogInModel logInModel = LogInModel();

  String? validateName(String? value){
    return logInModel.validateName(value);
  }

  String? validateEmail(String? value){
    return logInModel.validateEmail(value);
  }

  String? validateNumber(String? value){
    return logInModel.validateNumber(value);
  }

  String? validatePassword(String? value){
    return logInModel.validatePassword(value);
  }
}