import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlertDialogExample extends StatelessWidget {
  const AlertDialogExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(title: Text('Alert Dialog')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Show Dialog'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.defaultDialog(
                  title: "Hello",
                  titleStyle: TextStyle(color: Colors.black),
                  middleText: "Hello world!",
                  middleTextStyle: TextStyle(color: Colors.black),
                  // textConfirm: 'Confirm',
                  // textCancel: 'Cancel',
                  backgroundColor: Colors.blue[100],
                  cancel: TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text('Cancel', style: TextStyle(color: Colors.red)),
                  ),
                  cancelTextColor: Colors.red,
                  confirm: TextButton(
                    onPressed: () {},
                    child: Text('Save', style: TextStyle(color: Colors.green)),
                  ),
                  confirmTextColor: Colors.green,
                );
              },
              child: Text('Click'),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Show Snack Bar'),
            ),

            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Show Bottom sheet'),
            ),

          ],
        ),
      ),
    );
  }
}
