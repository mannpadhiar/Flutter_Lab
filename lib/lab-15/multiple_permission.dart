import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:permission_handler/permission_handler.dart';

class MultiplePermission extends StatefulWidget {
  const MultiplePermission({super.key});

  @override
  State<MultiplePermission> createState() => _MultiplePermissionState();
}

class _MultiplePermissionState extends State<MultiplePermission> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            Map<Permission, PermissionStatus> statuses =
              await [
                Permission.camera,
                Permission.manageExternalStorage,
              ].request();

            if(statuses[Permission.camera] == PermissionStatus.granted){
              Get.snackbar('camera allowed','yess!!');
            }
            if(statuses[Permission.storage] == PermissionStatus.granted){
              Get.snackbar('storage allowed','yess!!');
            }else{
              Get.snackbar('storage denied','noo!!',backgroundColor: Colors.red);
            }
          },
          child: Text('Multiple Permission'),
        ),
      ),
    );
  }
}
