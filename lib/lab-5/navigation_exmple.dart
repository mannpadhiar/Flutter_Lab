import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sem_5/lab-5/temp_example.dart';

class NavigationExample extends StatelessWidget {
  const NavigationExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: ElevatedButton(onPressed: () => Get.to(TempExample()), child: Text('Navigate')));
  }
}
