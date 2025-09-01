
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sem_5/lab-12/user_api_controller.dart';

class UserView extends StatelessWidget {
  UserView({super.key});

  UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final users = userController.users;
      return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            title: Text(user.name),
            subtitle: Text(user.email),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    userController.updateUser(user.id, "Updated Name", "updated@email.com");
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    userController.deleteUserWithDialog(user.id);
                  },
                ),
              ],
            ),
          );
        },
      );
    });
  }
}
