import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'non_reactive_controller.dart';

class TextFieldReactive extends StatelessWidget {
  TextFieldReactive({super.key});

  TextEditingController _controller = TextEditingController();
  var _reactive = Get.put(NonReactiveController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hello'),),
      body: Center(
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) => _reactive.changeText(value),
              controller: _controller,
            ),
            SizedBox(height: 10,),
            Obx(() => Text(_reactive.stringChange.toString()),),
          ],
        ),
      ),
    );
  }
}
