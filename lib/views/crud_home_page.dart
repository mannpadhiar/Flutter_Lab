import 'package:flutter/material.dart';

import '../controllers/crud_controller.dart';

class CrudHomePage extends StatefulWidget {
  const CrudHomePage({super.key});

  @override
  State<CrudHomePage> createState() => _CrudHomePageState();
}

class _CrudHomePageState extends State<CrudHomePage> {

  TextEditingController _name = TextEditingController();
  CrudController crudController = CrudController();
  
  bool isEdit = false;
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crud Operation'),
      ),
      body: Column(
        children: [
          Text('Enter name : '),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter your name',
                border:OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              controller: _name,
            ),
          ),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: () {
            if(isEdit){
              setState(() {
                crudController.editUser(name, _name.text);
              });
              isEdit = false;
            }else{
              setState(() {
                crudController.insertUser({'name': _name.text});
              });
            }
            _name.clear();
          }, child: isEdit?Text('Edit User') : Text('Add User')),
          SizedBox(height: 20,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                itemCount: crudController.users.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(crudController.users[index]['name']),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(onPressed: () {
                          setState(() {
                            crudController.deleteUser(crudController.users[index]['name']);
                          });
                        }, icon: Icon(Icons.delete)),
                        IconButton(onPressed: () {
                          setState(() {
                            isEdit = true;
                            name = crudController.users[index]['name'];
                            _name.text = name;
                          });
                        }, icon: Icon(Icons.edit)),
                      ],
                    ),
                  );
              },),
            ),
          ),
        ],
      ),
    );
  }
}
