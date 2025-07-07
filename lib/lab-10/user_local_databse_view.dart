import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sem_5/lab-10/database_controller.dart' show DatabaseController;
import 'package:sem_5/lab-10/user_model.dart';

class UserLocalDatabseView extends StatelessWidget {
  const UserLocalDatabseView({super.key});

  @override
  Widget build(BuildContext context) {
    int id = 0;

    final TextEditingController _name = TextEditingController();
    final TextEditingController _email = TextEditingController();

    final DatabaseController _databaseController = Get.put(
      DatabaseController(),
    );

    return Scaffold(
      appBar: AppBar(title: Text('CRUD OPERATION')),
      body: Column(
        children: [
          Padding(padding: const EdgeInsets.all(8.0), child: Text('name')),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            controller: _name,
          ),
          SizedBox(height: 20),

          Padding(padding: const EdgeInsets.all(8.0), child: Text('Email')),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            controller: _email,
          ),
          SizedBox(height: 20),

          ElevatedButton(
            onPressed: () {
              if (_databaseController.isEdit.value) {
                _databaseController.updateDataGetX(
                  User(name: _name.text, email: _email.text, id: id),
                );
              } else {
                _databaseController.addDataGetX(
                  User(name: _name.text, email: _email.text),
                );
              }
            },
            child: Obx(
              () =>  Text(
                _databaseController.isEdit.value ? 'Update Data' : 'Add Data',
              ),
            ),
          ),

          SizedBox(height: 10),

          Obx(
            () => ListView.separated(
              itemBuilder:
                  (context, index) => ListTile(
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            id = _databaseController.users[index].id!;
                            _databaseController.isEdit.value =
                                !_databaseController.isEdit.value;
                          },
                          icon: Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () {
                            _databaseController.deleteDataGetX(_databaseController.users[index].id!);
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ],
                    ),
                    title: Text(_databaseController.users[index].name),
                  ),
              separatorBuilder: (context, index) => Divider(),
              itemCount: _databaseController.users.length,
            ),
          ),
        ],
      ),
    );
  }
}
