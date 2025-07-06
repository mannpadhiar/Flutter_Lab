import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

class StudentDatabaseService {
  late Database studentDatabase;

  Future<void> initDatabase() async {
    try {
      final databasePath = await getDatabasesPath();
      studentDatabase = await openDatabase(
        path.join(databasePath, 'StudentDatabase.db'),
        version: 1,
        onCreate: (db, version) async {
          await db.execute(
            //aa table ma aatli vastu che
            //UniversityID int pk
            //UniversityName Text
            "CREATE TABLE University(UniversityID INTEGER PRIMARY KEY AUTOINCREMENT, UniversityName TEXT NOT NULL)",
          );
          await db.execute(
            //aa table ma aatli vastu che
            //StudentID int
            //StudentName Text
            //TwelfthPR Real(double)
            //DiplomaCgpa Real
            //UniversityID foreign key int
            "CREATE TABLE Student(StudentID INTEGER PRIMARY KEY AUTOINCREMENT, StudentName TEXT NOT NULL, TwelfthPR REAL, DiplomaCgpa REAL, UniversityID INTEGER, FOREIGN KEY(UniversityID) REFERENCES University(UniversityID))",
          );
        },
      );
    } catch (e) {
      print("Error in initializing student database : $e");
    }
  }

  Future<void> addStudent({
    required String StudentName,
    double? TwelfthPR,
    double? DiplomaCgpa,
    required String UniversityName,
  }) async {
    try {
      if (studentDatabase == null) await initDatabase();
      int? UniversityID = await addOrGetUniversityDetails(
        universityName: UniversityName,
      );
      await studentDatabase.insert('Student', {
        'StudentName': StudentName,
        'TwelfthPR': TwelfthPR,
        "DiplomaCgpa": DiplomaCgpa,
        "UniversityID": UniversityID,
      });
    } catch (e) {
      print("Error in adding student details : $e");
    }
  }

  Future<int> addOrGetUniversityDetails({
    required String universityName,
  }) async {
    int? UniversityID;
    try {
      if (studentDatabase == null) await initDatabase();
      List<Map<String, dynamic>> result = await studentDatabase.query(
        'University',
        where: "UniversityName = ?",
        whereArgs: [universityName],
      );
      print(result);
      if (result.isNotEmpty) {
        UniversityID = result.first['UniversityID'];
      } else {
        UniversityID = await studentDatabase.insert('University', {
          "UniversityName": universityName,
        });
      }
    } catch (e) {
      print("Error in adding university details : $e");
    }
    return UniversityID!;
  }

  Future<List<Map<String, dynamic>>> fetchAllStudentDetails() async {
    try {
      if (studentDatabase == null) await initDatabase();
      return await studentDatabase.rawQuery(
        'Select Student.StudentID, Student.StudentName, Student.TwelfthPR, Student.DiplomaCgpa, University.UniversityName AS UniversityName FROM Student JOIN University on Student.UniversityID = University.UniversityID',
      );
    } catch (e) {
      print("Error in fetching all student details $e");
    }
    return [];
  }
}