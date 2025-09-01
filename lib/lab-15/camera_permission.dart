import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:location/location.dart' hide PermissionStatus;
import 'package:permission_handler/permission_handler.dart';

class CamaraPermission extends StatefulWidget {
  const CamaraPermission({super.key});

  @override
  State<CamaraPermission> createState() => _CamaraPermissionState();
}

class _CamaraPermissionState extends State<CamaraPermission> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hello'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () async{
              final res = await Permission.camera.request();
              if(res.isGranted){
                Get.snackbar('Permission Granted','ayyyyoooo!!!',backgroundColor: Colors.green);
              }else if(res.isPermanentlyDenied){
                openAppSettings();
                Get.snackbar('Permission Denied','naiiiiiiiiii!!!',backgroundColor: Colors.red);
              }
            }, child: Text('Camera Permission')),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: () async{
              final res = await Permission.manageExternalStorage.request();
              if(res.isGranted){
                Get.snackbar('Permission Granted','Welcome',backgroundColor: Colors.green);
              }else{
                Get.snackbar('Permission Denied','your permission denied',backgroundColor: Colors.red);
              }
            }, child: Text('Storage Permission')),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: () async{

              var serviceStatus = await Permission.location.serviceStatus;
              if(serviceStatus.isEnabled){
                var status = await Permission.location.request();
                if(status == PermissionStatus.granted){
                  Get.snackbar('Permission Granted','Welcome!!',backgroundColor: Colors.green);
                }
              }
              else{
                Get.snackbar('Permission Denied','your permission denied',backgroundColor: Colors.red);
              }
            }, child: Text('Storage Permission')),
          ],
        ),
      ),
    );
  }
}
