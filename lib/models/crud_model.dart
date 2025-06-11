class CrudModel{
  final List<Map<String,dynamic>> _users = [];

  List<Map<String,dynamic>> get users => _users;

  void insertUser(Map<String,dynamic> user){
    _users.add(user);
    print('User is added!!');
  }

  void deleteUser(String name){
     _users.removeWhere((element) => element['name'] == name,);
    print('User is deleted');
  }

  void editUser(String oldName,String newName){
    print(oldName);
    print(newName);
    int index = _users.indexWhere((user) => user['name'] == oldName,);
    _users[index]['name'] =  newName;
    print('User is edited');
  }
}