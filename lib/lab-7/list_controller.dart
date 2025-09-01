import 'package:get/get.dart';

class ListController extends GetxController{
  RxList list = <Map<String,dynamic>>[].obs;
  RxBool isEdit = false.obs;

  void addUser(String user){
    list.add({'name':user,'isFav' : false});
    print('User added');
  }

  void deleteUser(Map<String,dynamic> user){
    list.remove(user);
    print('User deleted');
  }

  void editUser(String newUser,String oldUser){
    int index = list.indexWhere((element) => element['name'] == oldUser,);
    // list[index]['name'] = newUser;
    final updatedMap = Map<String, dynamic>.from(list[index]);
    updatedMap['name'] = newUser;
    list[index] = updatedMap;
  }

  void changeFavUser(Map<String,dynamic> user){
    int index = list.indexOf(user);
    list[index] = {
      'name' : user['name'],
      'isFav' : !user['isFav'],
    };
  }
}

// class User{
//   String name;
//   bool isFav = false;
//
//   User({required this.name});
// }