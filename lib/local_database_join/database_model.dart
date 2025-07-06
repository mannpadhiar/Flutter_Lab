import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseModel extends GetxController{
  late Database _database;

  RxList<Map<String,dynamic>> students = <Map<String,dynamic>>[].obs;

  RxBool isEdit = false.obs;

  Future<void> initDataBase() async{
    _database = await openDatabase(
      join(await getDatabasesPath(),'student.db'),
      version: 1,
      onCreate: (db, version) async{
        await db.execute('''
          CREATE TABLE students(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE departments(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            student_id INTEGER,
            FOREIGN KEY(student_id) REFERENCES students(id)
          )
        ''');
      },
    );
    await fetchData();
  }

  Future<void> insertData(String name,String depName,int id) async{
    int studentId = await _database.insert('students', {'name' : name});
    await _database.insert('departments',{
      'name' : depName,
      'student_id' : studentId
    } );

    print('add data executed');

    await fetchData();
  }

  Future<void> fetchData() async{
    final data = await _database.rawQuery(
      '''
        SELECT students.id AS student_id, 
              students.name AS student_name,
              departments.id AS department_id, 
              departments.name AS department_name
        FROM departments join  students 
        on students.id = departments.student_id
      '''
    );

    print('Data is ::::: $data');

    students.value = data;
  }

  Future<void> deleteData(int studentId) async{
    await _database.delete('students',whereArgs: [studentId],where: 'id = ?');
    await _database.delete('departments',whereArgs: [studentId],where: 'student_id = ?');

    await fetchData();

    print('student deleted !!!!');
  }

  Future<void> editData({required String studentName,required String departmentName,required int studentId}) async{
  await _database.update('students',{
    'name' : studentName,
    },
    where: 'id = ?',
    whereArgs: [studentId],
  );

  await _database.update('departments', {
    'name' : departmentName,
    },
    where: 'student_id = ?',
    whereArgs: [studentId],
  );

  await fetchData();
}

  @override
  void onInit() async{
    super.onInit();
    await initDataBase();
  }
}