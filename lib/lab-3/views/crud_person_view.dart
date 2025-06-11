import 'package:flutter/material.dart';
import 'package:sem_5/lab-3/controller/person_controller.dart';

import '../model/user_crud.dart';

class CrudPersonView extends StatefulWidget {
  const CrudPersonView({super.key});

  @override
  State<CrudPersonView> createState() => _CrudPersonViewState();
}

class _CrudPersonViewState extends State<CrudPersonView> {

  bool isEdit = false;

  PersonController _personController = PersonController();
  TextEditingController _name = TextEditingController();

  late Person temp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CRUD Operation')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Name :'),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter your name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              controller: _name,
            ),
            SizedBox(height: 12,),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if(isEdit){
                    _personController.editPerson(temp, Person(name: _name.text));
                    isEdit = false;
                  }else{
                    _personController.addPerson(Person(name: _name.text));
                  }
                  _name.clear();
                  setState(() {});
                },
                child: Text(isEdit?'Edit':'Add'),
              ),
            ),
            SizedBox(height: 4),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                itemCount: _personController.getPersons.length,
                itemBuilder:
                    (context, index) => ListTile(
                      title: Text(_personController.getPersons[index].name),
                      trailing: IconButton(
                        onPressed: () {
                          _personController.deleteUser(
                            _personController.getPersons[index],
                          );
                          setState(() {});
                        },
                        icon: Icon(Icons.delete,color: Colors.red,),
                      ),
                      leading: IconButton(onPressed: () {
                        setState(() {
                          temp = _personController.getPersons[index];
                          isEdit = true;
                        });
                      }, icon: Icon(Icons.edit,color: Colors.green,)),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
