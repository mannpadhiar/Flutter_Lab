import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sem_5/profile/controller/user_profile_controller.dart';

class ProfileHomePage extends StatefulWidget {
  const ProfileHomePage({super.key});

  @override
  State<ProfileHomePage> createState() => _ProfileHomePageState();
}

class _ProfileHomePageState extends State<ProfileHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile Card'),),
      body: Center(
        child: Container(
          height: 200,
          width: 400,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX:10,
                sigmaY:10,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: CircleAvatar(child: Icon(Icons.person,size: 35,),radius: 35,),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name : ${UserProfileController.user.name!}'),
                        Divider(),
                        Text('Email : ${UserProfileController.user.email!}'),
                        Divider(),
                        Text('Number : ${UserProfileController.user.number!}'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
