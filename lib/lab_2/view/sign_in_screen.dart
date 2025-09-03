import 'package:flutter/material.dart';
import 'package:sem_5/lab_2/view/product_view.dart';

import '../../lab-12/user_api_controller.dart';

class UserSignUp extends StatefulWidget {
  const UserSignUp({super.key});

  @override
  State<UserSignUp> createState() => _UserSignUpState();
}

class _UserSignUpState extends State<UserSignUp> {


  GlobalKey<FormState> formKey = GlobalKey();

  UserController userController = UserController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailCOntroller = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController conformPasswordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    addressController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    emailCOntroller.dispose();
    conformPasswordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignUp Screen',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.indigo[600],
        centerTitle: true,
      ),
      body: Container(
        child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsetsGeometry.all(10),
            child: Column(
              children: [
                SizedBox(height: 12,),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(label: Text('Enter your Name',style: TextStyle(color: Colors.black),),fillColor: Colors.indigo[50],filled: true,border: OutlineInputBorder(borderRadius: BorderRadius.circular(6))),
                ),
                SizedBox(height: 8,),
                TextFormField(
                  controller: addressController,
                  decoration: InputDecoration(label: Text('Enter your Address',style: TextStyle(color: Colors.black),),fillColor: Colors.indigo[50],filled: true,border: OutlineInputBorder(borderRadius: BorderRadius.circular(6))),
                ),
                SizedBox(height: 8,),
                TextFormField(
                  controller: phoneNumberController,
                  decoration: InputDecoration(label: Text('Enter your Phone Number',style: TextStyle(color: Colors.black),),fillColor: Colors.indigo[50],filled: true,border: OutlineInputBorder(borderRadius: BorderRadius.circular(6))),
                ),
                SizedBox(height: 8,),
                TextFormField(
                  controller: emailCOntroller,
                  decoration: InputDecoration(label: Text('Enter your Email',style: TextStyle(color: Colors.black),),fillColor: Colors.indigo[50],filled: true,border: OutlineInputBorder(borderRadius: BorderRadius.circular(6))),
                ),
                SizedBox(height: 8,),
                ElevatedButton(
                  style: ButtonStyle(elevation: WidgetStatePropertyAll(0),backgroundColor:WidgetStatePropertyAll(Colors.black.withOpacity(0.8)),
                  shape:WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      side: BorderSide(color: Colors.indigo[300]!, width: 2),
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  ),
                    onPressed: () {
                  Map<String,dynamic> data = {'name': nameController.text,'address': addressController.text,'number' : phoneNumberController.text,'email' : emailCOntroller.text};
                  Navigator.push(context,MaterialPageRoute(builder: (context) => Profile_view(data),));
                }, child: const Text('SUBMIT',style: TextStyle(color: Colors.white),))
              ],
            ),
          ),
        ),
      ),
    );
  }
}