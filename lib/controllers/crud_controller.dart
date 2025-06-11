
import '../models/crud_model.dart';

class CrudController{
  final CrudModel _model = CrudModel();

  get users => _model.users;

  void insertUser(Map<String,dynamic> user){
    _model.insertUser(user);
  }

  void deleteUser(String name){
   _model.deleteUser(name);
  }

  void editUser(String oldName,String newName){
    _model.editUser(oldName, newName);
  }
}