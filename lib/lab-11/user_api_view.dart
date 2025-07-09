import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sem_5/lab-11/user_api_controller.dart';

class UserApiView extends StatelessWidget {
  UserApiView({super.key});

  UserControllerApi _userControllerApi = Get.put(UserControllerApi());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Api Users')),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () =>  ListView.separated(
                itemBuilder: (context, index) => ListTile(
                  title: Text(_userControllerApi.apiUsers[index].name),
                ),
                separatorBuilder: (context, index) => Divider(),
                itemCount: _userControllerApi.apiUsers.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
