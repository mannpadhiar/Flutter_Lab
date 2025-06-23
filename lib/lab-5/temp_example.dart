import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TempExample extends StatelessWidget {
  TempExample({super.key});

  @override
  Widget build(BuildContext context) {
    // final data =Get.arguments;
    return Scaffold(
      appBar: AppBar(title: Text('TEMP Page'),),
      body: Column(
        children: [
          Center(child: Text('You are at Navigation')),
          SizedBox(height: 20,),
          // ElevatedButton(onPressed: () => Get.back(), child: Text('BACK')),
          Center(child: ElevatedButton(onPressed: () => Get.back(), child: Text('BACK'))),
          SizedBox(height: 20,),
          Text('hello'),
        ],
      ),
    );
  }
}
