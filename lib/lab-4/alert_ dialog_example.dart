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
            ElevatedButton(
              onPressed: () {
                Get.snackbar(
                  "Snack bar showed",
                  'working complitly fine',
                  icon: Icon(Icons.account_balance),
                  shouldIconPulse: true,
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundGradient: LinearGradient(
                    colors: [Color(0xFF25C263), Color(0xFF0575E6)],
                  ),
                );
              },
              child: Text('Click'),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Show Bottom sheet'),
            ),
            ElevatedButton(
              onPressed: () async{
                Get.bottomSheet(
                  barrierColor: Colors.transparent,
                  enterBottomSheetDuration: Duration(milliseconds: 200),
                  exitBottomSheetDuration: Duration(milliseconds: 200),
                  isDismissible: true,
                  backgroundColor: Colors.black38,
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: LinearGradient(colors: [
                            Color(0xdecebeb),
                            Color(0x22f8f8f8)
                          ])
                        ),
                        child: ListView.builder(
                          itemCount: 10,
                          itemBuilder:
                              (context, index) =>
                                  ListTile(title: Text('Hello $index')),
                        ),
                      ),
                    ),
                  ),
                );
                // await Future.delayed(Duration(milliseconds: 300));
                // Get.back();
              },
              child: Text('Click'),
            ),
          ],
        ),
      ),
    );
  }
}
