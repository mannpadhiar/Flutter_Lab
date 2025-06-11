import 'package:flutter/material.dart';
import '../controllers/log_in_controller.dart';

class LogInView extends StatefulWidget {
  const LogInView({super.key});

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {

  final formKey = GlobalKey<FormState>();

  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _passsword = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();
  TextEditingController _number = TextEditingController();

  LogInController _controller = LogInController();

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

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Password'),
              ),
              TextFormField(
                validator: _controller.validatePassword,
                controller: _passsword,
                obscureText: true,
                decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
              ),
              SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Confirm Password'),
              ),
              TextField(
                controller: _confirmPassword,
                obscureText: true,
                decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
              ),
              SizedBox(height: 20,),

              Center(
                child: ElevatedButton(onPressed: () {
                  if(!formKey.currentState!.validate() && _passsword.text == _confirmPassword.text){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid Input')));
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Valid Input')));
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
