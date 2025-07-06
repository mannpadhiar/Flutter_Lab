import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sem_5/tempppp/view.dart';

class StudentCrudView extends StatelessWidget {
  StudentCrudView({super.key});

  StudentDatabaseController studentDatabaseController =
  Get.find<StudentDatabaseController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Student CRUD With Table Join")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: studentDatabaseController.StudentName,
              decoration: InputDecoration(
                labelText: "Student Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: "Diploma Cgpa",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onChanged: (value) {
                studentDatabaseController.DiplomaCgpa = double.parse(value);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: "12th PR",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onChanged: (value) {
                studentDatabaseController.TwelfthPR = double.parse(value);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: studentDatabaseController.UniversityName,
              decoration: InputDecoration(
                labelText: "University Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              studentDatabaseController.addStudent();
            },
            child: Text("Add Student"),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Obx(
                  () => ListView.separated(
                itemBuilder: (context, index) {
                  Map<String, dynamic> student =
                  studentDatabaseController.students[index];
                  return studentDatabaseController.students.isEmpty
                      ? Column(
                    children: [
                      Icon(
                        Icons.person_off,
                        color: Colors.grey,
                        size: 30,
                      ),
                      Text("No students found!!"),
                    ],
                  )
                      : Card(
                    child: Column(
                      children: [
                        Text(student["StudentName"]),
                        SizedBox(height: 2),
                        Text(student["UniversityName"]),
                        SizedBox(height: 2),
                        Text(student["TwelfthPR"].toString()),
                        SizedBox(height: 2),
                        Text(student["DiplomaCgpa"].toString()),
                        SizedBox(height: 2),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(thickness: 2, color: Colors.white);
                },
                itemCount: studentDatabaseController.students.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}