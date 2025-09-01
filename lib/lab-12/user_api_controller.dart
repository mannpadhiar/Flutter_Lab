import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sem_5/lab-12/user_api_services.dart';
import 'user_api_model.dart';

class UserController extends GetxController {
  final api = UserApiService();
  var users = <UserApi>[].obs;

  Future<void> fetchUsers() async {
    final res = await api.getUsers();
    if (res.isOk) {
      users.value = (res.body as List).map((e) => UserApi.fromJson(e)).toList();
    }
  }

  Future<void> addUser(String name, String email) async {
    final res = await api.postUser(UserApi(id: '', name: name, email: email));
    if (res.isOk) fetchUsers();
  }

  Future<void> updateUser(String id, String name, String email) async {
    final res = await api.putUser(id, UserApi(id: id, name: name, email: email));
    if (res.isOk) fetchUsers();
  }

  Future<void> deleteUserWithDialog(String id) async {
    Get.defaultDialog(
      title: "Delete User",
      middleText: "Are you sure you want to delete this user?",
      confirm: ElevatedButton(
        onPressed: () async {
          final res = await api.deleteUser(id);
          if (res.isOk) {
            Get.back();
            fetchUsers();
          }
        },
        child: Text("Yes"),
      ),
      cancel: ElevatedButton(
        onPressed: () => Get.back(),
        child: Text("No"),
      ),
    );
  }
}
