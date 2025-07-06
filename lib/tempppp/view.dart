import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'model.dart';

class StudentDatabaseController extends GetxController {
  RxList<Map<String, dynamic>> _students = <Map<String, dynamic>>[].obs;
  StudentDatabaseService _studentDatabaseService = StudentDatabaseService();
  TextEditingController StudentName = TextEditingController();
  TextEditingController UniversityName = TextEditingController();
  double? TwelfthPR;
  double? DiplomaCgpa;

  @override
  void onInit() async {
    super.onInit();
    await _studentDatabaseService.initDatabase();
    await fetchAllStudents();
  }

  RxList<Map<String, dynamic>> get students => _students;

  set students(RxList<Map<String, dynamic>> value) {
    _students = value;
  }

  Future<void> addStudent() async {
    await _studentDatabaseService.addStudent(
      StudentName: StudentName.text,
      TwelfthPR: TwelfthPR,
      DiplomaCgpa: DiplomaCgpa,
      UniversityName: UniversityName.text,
    );
    await fetchAllStudents();
  }

  Future<void> fetchAllStudents() async {
    students.value = await _studentDatabaseService.fetchAllStudentDetails();
    print(students);
  }
}