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
    // showDialog(context: context, builder: (context) => Center(child: CircularProgressIndicator()),);
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('users').get();
    users.clear();
    for (var doc in querySnapshot.docs) {
      users.add(doc);
      print(doc.id);
    }

    // Navigator.pop(context);
  }

  void deleteData(String id) async {
    await FirebaseFirestore.instance.collection('users').doc(id).delete();
    getUsers();
  }

  void addData(String name, String email) async {
    await FirebaseFirestore.instance.collection('users').add({
      'name': name,
      'email': email,
    });
    getUsers();
  }

  void updateData(String id, String name, String email) async {
    await FirebaseFirestore.instance.collection('users').doc(id).update({
      'name': name,
      'email': email,
    });
    getUsers();
  }

  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  RxList users = [].obs;

  RxBool isEdit = false.obs;

  String editId = '';

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
          Obx(
            () =>  ElevatedButton(
              onPressed: () async {
                if(isEdit.value){
                  updateData(editId, name.text, email.text);
                  isEdit.value = false;
                }
                else{
                  addData(name.text, email.text);
                }
              },
              child: Text(isEdit.value?'Edit user':'Add User'),
            ),
          ),
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
                itemCount: users.length,
                itemBuilder: (context, index) {
                  var user = users[index];
                  return ListTile(
                    title: Text(user.data()['name']),
                    subtitle: Text(user.data()['email']),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            isEdit.value = !isEdit.value;
                            editId = user.id;
                            name.text = user.data()['name'];
                            email.text = user.data()['email'];
                          },
                          icon: Icon(Icons.edit_outlined, color: Colors.green),
                        ),

                        IconButton(
                          icon: Icon(Icons.delete_outline),
                          color: Colors.red,
                          onPressed: () {
                            print(user.id);
                            deleteData(user.id);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
