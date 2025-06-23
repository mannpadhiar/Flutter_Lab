import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sem_5/lab-5/temp_example.dart';

class NavigationExample extends StatelessWidget {
  const NavigationExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Navigation'),),
      body: ElevatedButton(onPressed: () => Get.toNamed('tempExample',arguments: ["First data", "Second data"]), child: Text('Navigate')),
    );
  }
}
