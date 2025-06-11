class ProfileModel{
  String? validateName(String? value){
    if(value == null || value.isEmpty){
      return 'Enter valid name';
    }
    return null;
  }

  String? validateEmail(String? value){
    RegExp regExp = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    if(value == null || value.isEmpty){
      return 'Enter your email';
    }
    else if(!regExp.hasMatch(value)){
      return 'Enter valid Email';
    }
    else{
      return null;
    }
  }

  String? validateNumber(String? value){
    RegExp regExp = RegExp(r'^(\+\d{2})?\d{10}$');

    if(value == null || value.isEmpty){
      return 'Enter your Number';
    }
    else if(!regExp.hasMatch(value)){
      return 'Enter valid Number';
    }
    else{
      return null;
    }
  }

  String? validatePassword(String? value){
    RegExp regExp = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$');

    if(value == null || value.isEmpty){
      return 'Enter your Password';
    }
    else if(!regExp.hasMatch(value)){
      return 'Enter valid Password';
    }
    else{
      return null;
    }
  }
}
