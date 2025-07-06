import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'database_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadApp.custom(
      appBuilder:
          (context) => MaterialApp(
            darkTheme: ThemeData.dark(),
            home: DatabaseJoinView(),
          ),
    );
  }
}

class DatabaseJoinView extends StatelessWidget {
  DatabaseJoinView({super.key});

  final TextEditingController _name = TextEditingController();
  final TextEditingController _department = TextEditingController();

  final DatabaseModel _databaseModel = Get.put(DatabaseModel());

  int stuId = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Crud Oppressions')),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: const EdgeInsets.all(4.0), child: Text('name')),
            ShadInput(
              controller: _name,
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.yellow,
              placeholder: Text('Enter your name '),
              keyboardType: TextInputType.emailAddress,
            ),

            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text('Department'),
            ),
            ShadInput(
              controller: _department,
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.yellow,
              placeholder: Text('Enter your department name'),
              keyboardType: TextInputType.emailAddress,
            ),

            const SizedBox(height: 20),
            Center(
              child: ShadButton(
                backgroundColor: Colors.green,
                child: Obx(() => Text(_databaseModel.isEdit.value? 'Edit Student':'Add Student')),
                onPressed: () {
                  if(_databaseModel.isEdit.value){
                    _databaseModel.editData(studentName: _name.text,departmentName: _department.text,studentId: stuId);
                    _databaseModel.isEdit.value = false;
                  }else{
                    _databaseModel.insertData(_name.text, _department.text, 1);
                    print('User added');
                  }

                  _name.clear();
                  _department.clear();
                },
              ),
            ),

            Obx(
              () => Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) => ListTile(
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(onPressed: () {
                          stuId = _databaseModel.students[index]['student_id'];
                          _name.text =  _databaseModel.students[index]['student_name'];
                          _department.text =  _databaseModel.students[index]['department_name'];
                          _databaseModel.isEdit.value = !_databaseModel.isEdit.value;
                        } , icon: Icon(Icons.edit)),

                        IconButton(onPressed: () {
                          _databaseModel.deleteData(_databaseModel.students[index]['student_id']);
                        } , icon: Icon(Icons.delete)),
                      ],
                    ),
                    title: Text(_databaseModel.students[index]['student_name']),
                    subtitle: Text(_databaseModel.students[index]['department_name']),
                  ),
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: _databaseModel.students.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
