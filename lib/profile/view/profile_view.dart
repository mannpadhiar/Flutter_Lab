import 'package:flutter/material.dart';
import 'package:sem_5/profile/controller/profile_controller.dart';
import 'package:sem_5/profile/controller/user_profile_controller.dart';
import 'package:sem_5/profile/view/profile_home_page.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {

  final formKey = GlobalKey<FormState>();

  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _number = TextEditingController();

  final ProfileController _controller = ProfileController();
  final UserProfileController _upcontroller = UserProfileController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign in",style: TextStyle(color: Colors.black),),backgroundColor: Colors.teal),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Name'),
              ),
              TextFormField(
                validator: _controller.validateName,
                controller: _name,
                decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
              ),
              SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Email'),
              ),
              TextFormField(
                validator: _controller.validateEmail,
                controller: _email,
                decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
              ),
              SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Number'),
              ),
              TextFormField(
                validator: _controller.validateNumber,
                controller: _number,
                decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
              ),
              SizedBox(height: 10,),

              Center(
                child: ElevatedButton(onPressed: () {
                  if(!formKey.currentState!.validate()){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid Input')));
                  }else{
                    _upcontroller.setDetails(_name.text,_email.text, _number.text);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileHomePage(),));
                  }
                }, child: Text('LogIn')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
