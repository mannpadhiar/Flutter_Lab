import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sem_5/lab-7/list_controller.dart';

class Rxlistexample extends StatelessWidget {
  Rxlistexample({super.key});

  final ListController _listController = Get.find<ListController>();
  TextEditingController _controller = TextEditingController();
  String tempUser = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('This is Rx list')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text('Name : '),
            TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Obx(
              () =>  ElevatedButton(
                onPressed: () {
                  if(_listController.isEdit.value){
                    _listController.editUser(_controller.text, tempUser);
                    _listController.isEdit.value = false;
                    _listController.update();
                  }
                  else{
                    _listController.addUser(_controller.text);
                  }
                },
                child: Text( _listController.isEdit.value?'Edit':'Add'),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Obx(
                () =>
                    ListView.separated(
                  separatorBuilder:
                      (context, index) => Divider(color: Colors.white24),
                  itemCount: _listController.list.length,
                  itemBuilder:
                      (context, index) => ListTile(
                        leading: IconButton(onPressed: () =>  _listController.changeFavUser(_listController.list[index]), icon: Icon(_listController.list[index]['isFav']?Icons.favorite:Icons.favorite_outline_rounded)),
                        title: Obx(() =>  Text(_listController.list[index]['name'])),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                _listController.isEdit.value = ! _listController.isEdit.value;
                                tempUser = _listController.list[index]['name'];
                                _controller.text = _listController.list[index]['name'];
                                },
                              icon: Icon(Icons.edit),
                            ),
                            IconButton(
                              onPressed: () {
                                _listController.deleteUser(
                                  _listController.list[index],
                                );
                              },
                              icon: Icon(Icons.delete),
                            ),
                          ],
                        ),
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
