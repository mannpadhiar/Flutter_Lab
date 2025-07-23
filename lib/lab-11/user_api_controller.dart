import 'dart:convert';

import 'package:get/get.dart';
import 'package:sem_5/lab-11/user_api_model.dart';
import 'package:http/http.dart' as http;

class UserControllerApi extends GetxController{
  final RxList _users = [].obs;

  Rx<RxStatus> status = RxStatus.loading().obs;
  get apiUsers => _users;

  Future<void> fetchUsersFromApi() async{
    try{
      status.value = RxStatus.loading();
      final res = await http.get(Uri.parse('https://67c5368cc4649b9551b5aa00.mockapi.io/mmony/temp'));
      if(res.statusCode == 200){
        final temp = List.from(jsonDecode(res.body)).map((e) => UserApi.fromMap(e),).toList();
        _users.value = temp;
        status.value = RxStatus.success();
      }else{
        status.value = RxStatus.error('there is some error');
        throw Exception('Failed to load data');
      }
    }catch(e){
      status.value = RxStatus.error('there is some error');
      print('error is : $e');
    }
  }

  @override
  void onInit() async{
    super.onInit();
    await fetchUsersFromApi();
  }
}