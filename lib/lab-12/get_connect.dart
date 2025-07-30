import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetConnectExample extends StatelessWidget {
  GetConnectExample({super.key});

  Users _users = Users();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('App Bar'),),
      body: Column(
        children: [

        ],
      )
    );
  }
}

class Users extends GetConnect{
  Future<List<dynamic>> fetchUsers() async{
    try{
      final res = await get('https://67c5368cc4649b9551b5aa00.mockapi.io/mmony/temp');
      return res.body;
    }catch(e){
      print('Error in fetching users : $e');
    }
    return [];
  }
}
