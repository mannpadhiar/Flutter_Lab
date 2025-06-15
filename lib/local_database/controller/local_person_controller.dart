import '../model/person_model.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';


class LocalPersonController{
  List<Map<String,dynamic>> _persons = [];
  late Database _database;

  Future<void> initDataBase() async{
    _database = await openDatabase(
      path.join(await getDatabasesPath(),'persons.db'),
      version: 1,
      onCreate: (db, version) {
        db.execute('''
         CREATE TABLE student(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT   
         )
         ''');
      },
    );
  }

  get persons => _persons;

  Future<List<Map<String,dynamic>>> fetchUsers() async{
    final List<Map<String, dynamic>> tempUser = await _database.query('student');
    _persons = tempUser;
    return tempUser;
  }

  Future<void> addLocalPerson(String name) async{
    await _database.insert('student', {'name':name});
    await fetchUsers();
    print(_persons);
  }

  Future<void> deleteUser(int id) async{
    await _database.delete(
      'student',
      where: 'id = ?',
      whereArgs: [id],
    );
    await fetchUsers();
  }

  Future<void> editPerson(int id,String newName) async{
    await _database.update(
      'student',
      {'name' : newName},
      where: 'id = ?',
      whereArgs:  [id],
    );
    fetchUsers();
  }
}