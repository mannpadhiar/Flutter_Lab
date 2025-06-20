import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sem_5/profile/view/profile_home_page.dart';
import 'package:sem_5/profile/view/profile_view.dart';
import 'package:sem_5/temp.dart';
import 'package:sem_5/views/log_in_view.dart';

import 'E-commerce/views/e_commerce_view.dart';
import 'lab-3/views/crud_person_view.dart';
import 'lab-4/alert_ dialog_example.dart';
import 'local_database/view/local_person_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: LiquidGlassEffect(),
    );
  }
}

