import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sqflite/sqflite.dart';

class GoogleLoginExample extends StatefulWidget {
  const GoogleLoginExample({super.key});

  @override
  State<GoogleLoginExample> createState() => _GoogleLoginExampleState();
}

class _GoogleLoginExampleState extends State<GoogleLoginExample> {
  @override
  void initState() {
    super.initState();
    getUsers();
  }

  void getUsers() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('users').get();
  }

  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  RxList<Map<String, dynamic>> users = <Map<String, dynamic>>[].obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Column(
        children: [
          TextFormField(controller: name),
          SizedBox(height: 10),
          TextFormField(controller: email),
          SizedBox(height: 20),
          ElevatedButton(onPressed: () async {}, child: Text('Add User')),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () async {
              FirebaseAuth _auth = FirebaseAuth.instance;
              final GoogleSignIn googleSignIn = GoogleSignIn.instance;
              await googleSignIn.initialize(
                clientId:
                    "905312702990-ijolbloba3kquraj3na5fda86jt7t8ru.apps.googleusercontent.com",
              );
              GoogleSignInAccount googleSignInAccount = await googleSignIn
                  .authenticate(scopeHint: ['email']);
              print(googleSignInAccount.email);
            },
            child: Text('Sign In'),
          ),

          Expanded(
            child: Obx(
              () => ListView.builder(
                itemBuilder:
                    (context, index) => ListTile(title: users[index]['name']),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
