import '../models/like_unlike_model.dart';

class LikeUnlikeController{
  LikeUnlikeModel _model = LikeUnlikeModel();

  get users => _model.users;

  void insertData(Map<String,dynamic> user){
    _model.insertData(user);
  }

  void favouriteUser(bool isFav,String name){
    _model.favouriteUser(isFav, name);
  }
}