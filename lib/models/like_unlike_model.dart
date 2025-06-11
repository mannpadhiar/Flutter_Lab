class LikeUnlikeModel{
  List<Map<String,dynamic>> _users = [
    {'name':'mann','isFav':false},
    {'name':'meet','isFav':false},
    {'name':'het','isFav':false},
    {'name':'raghav','isFav':false},
    {'name':'raju','isFav':false},
    {'name':'yash','isFav':false},
    {'name':'vandan','isFav':false},
  ];

  List<Map<String,dynamic>> get users => _users;

  void insertData(Map<String,dynamic> user){
    _users.add(user);
    print('User is added');
  }

  void favouriteUser(bool isFav,String name){
    int index = _users.indexWhere((element) => element['name'] == name,);
    _users[index]['isFav'] = isFav;
    print('isFav is updated');
  }
}