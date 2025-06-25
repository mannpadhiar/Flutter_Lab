import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'non_reactive_controller.dart';

class NonReactive extends StatelessWidget {
  NonReactive({super.key});

   var _reactive = Get.put(NonReactiveController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Non-Reactive'),),
      body: Column(
        children: [
          ElevatedButton(onPressed: () {
            _reactive.increment();
          }, child: Text('Increment')),
          Obx(() =>  Text(_reactive.count.toString()),),
        ],
      ),
    );
  }
}
