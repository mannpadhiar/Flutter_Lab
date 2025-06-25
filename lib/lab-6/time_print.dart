import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'non_reactive_controller.dart';

class TimePrint extends StatelessWidget {
  TimePrint({super.key});

  var _reactive = Get.put(NonReactiveController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TIMER'),),
      body: Column(
        children: [
          Obx(() => Text(_reactive.time.toString())),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: () => _reactive.setTimer(), child: Text('START'))
        ],
      ),
    );
  }
}
