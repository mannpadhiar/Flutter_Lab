import 'package:flutter/material.dart';

import '../controller/local_person_controller.dart';

class LocalPersonView extends StatefulWidget {
  const LocalPersonView({super.key});

  @override
  State<LocalPersonView> createState() => _LocalPersonViewState();
}

class _LocalPersonViewState extends State<LocalPersonView> {
  TextEditingController _name = TextEditingController();
  final LocalPersonController _controller = LocalPersonController();

  bool isEdit = false;
  int ediIndex = -1;

  List<Map<String, dynamic>> persons = [];

  Future<void> fetchUserData() async {
    var data = await _controller.fetchUsers();
    setState(() {
      persons = data;
    });
  }

  void _init() async {
    await _controller.initDataBase();
    await fetchUserData();
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Local Database')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(padding: const EdgeInsets.all(8.0), child: Text('Name :')),
            TextFormField(
              controller: _name,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                if(isEdit){
                  _controller.editPerson(_controller.persons[ediIndex]['id'], _name.text);
                  isEdit = false;
                }else{
                  _controller.addLocalPerson(_name.text);
                }
                await fetchUserData();
                setState(() {});
                _name.clear();
              },
              child: Text(isEdit?'Edit':'Add'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _controller.persons.length,
                itemBuilder:
                    (context, index) => ListTile(
                      title: Text(_controller.persons[index]['name']),
                      leading: IconButton(onPressed: () {
                        ediIndex = index;
                        isEdit = true;
                        setState(() {});
                      }, icon: Icon(Icons.edit)),
                      trailing: IconButton(onPressed: () async{
                        await _controller.deleteUser(_controller.persons[index]['id']);
                        setState(() {});
                      }, icon: Icon(Icons.delete,color: Colors.red,)),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
