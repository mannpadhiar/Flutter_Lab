import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetExample extends StatelessWidget {
  const BottomSheetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bottom Sheet'),),
      body: Center(
        child: ElevatedButton(
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
      ),
    );
  }
}
