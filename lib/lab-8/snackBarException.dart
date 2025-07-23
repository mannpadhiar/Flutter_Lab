import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarException extends StatelessWidget {
  SnackBarException({super.key});

  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('App Bar'),),
      body: Column(
        children: [
          TextFormField(
            controller: name,
          ),

          ElevatedButton(onPressed: () {
            try{
              int.parse(name.text);
            }catch(e){
              Get.snackbar('Exception', '$e',snackPosition: SnackPosition.BOTTOM);
            }
          }, child: Text('Format'))
        ],
      ),
    );
  }
}
