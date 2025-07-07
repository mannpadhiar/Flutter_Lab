import 'package:get/get.dart';
import 'package:path/path.dart' as path;
import 'package:sem_5/lab-10/user_model.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase{
  late Database _database;

  Future<void> initDatabase() async {
    _database = await openDatabase(
      path.join(await getDatabasesPath(), 'StudentsDatabase.db'),
      version: 1,
      onCreate: (db, version) {
        db.execute(''''
          CREATE TABLE users(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            email TEXT NOT NULL,
          )
        ''');
      },
    );
  }

  Future<List<Map<String, dynamic>>> fetchData() async {
    final data = await _database.query('users');
    return data;
  }

  Future<void> addData(User user) async{
    await _database.insert('users', User.toMap(user));
    print('user added');
  }

  Future<void> deleteUser(int id) async {
    await _database.delete('users', where: 'id = ?', whereArgs: [id]);
    print('user deleted');
  }

  Future<void> updateUser(User user) async {
    await _database.update(
      'users',
      User.toMap(user),
      where: 'id = ?',
      whereArgs: [user.id],
    );
    print('User updated');
  }
}
