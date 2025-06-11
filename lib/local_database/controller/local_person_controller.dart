import '../model/person_model.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';


class LocalPersonController{
  final List<Person> _persons = [];
  late Database db;

  void initDataBase() async{
    var db = await openDatabase(
      path.join(await getDatabasesPath(),'persons.db'),
      onCreate: (db, version) {
        db.execute('''
         CREATE TABLE student(
          int id 
         )
         ''');
      },
    );
  }

  get getPersons => _persons;

  void addPerson(Person person){
    _persons.add(person);
    print('Person added');
  }

  void deleteUser(Person person){
    _persons.removeWhere((element) => element.name == person.name,);
  }

  void editPerson(Person oldPerson,Person newPerson){
    int index = _persons.indexWhere((element) => element.name == oldPerson.name,);
    _persons[index] = newPerson;
  }
}