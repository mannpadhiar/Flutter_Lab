import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:path_provider/path_provider.dart';

class FileExample extends StatefulWidget {
  FileExample({super.key});

  @override
  State<FileExample> createState() => _FileExampleState();
}

class _FileExampleState extends State<FileExample> {

  String? path = '';

  RxString data = ''.obs;

  Future<String?> getPath() async{
    Directory? dir = await getExternalStorageDirectory();
    return dir!.path;
  }

  Future<void> writeData(String data) async{
    path = await getPath();
    if(path == null){
      print('Path is null');
    }else{
      File file = File("$path/abc.txt");
      file.writeAsStringSync(data);
      print("$data :: is written in file");
    }

    await readDataFromFile();
  }

  Future<void> readDataFromFile() async{
    path = await getPath();
    if(path == null){
      print('Path is null');
    }else{
      File file = File("$path/abc.txt");
      data.value = file.readAsStringSync();
    }
  }

  Future<void> deleteData() async{
    path = await getPath();
    if(path == null){
      print('Path is null');
    }else{
      File file = File("$path/abc.txt");
      print('data deleted');
      file.deleteSync();
      print(await file.exists());
    }
  }

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('File Example'),),
      body: Column(
        children: [
          TextFormField(
            controller: _controller,
          ),

          ElevatedButton(onPressed: () async{
            await writeData(_controller.text);
          }, child: Text('enter data')),

          SizedBox(height: 20,),

          ElevatedButton(onPressed: () async{
            await deleteData();
          }, child: Text('Delete File')),

          SizedBox(height: 30,),
          Obx(() =>  Text(data.value)),
        ],
      ),
    );
  }
}

