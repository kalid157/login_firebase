import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_page/components/button.dart';
import 'package:login_page/components/imagepath.dart';
import 'package:login_page/components/textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  //ontap fonction
  void signUp() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50),

              //section icon
              Icon(Icons.lock, size: 50),

              SizedBox(height: 30),
              //Text Welcom
              Text('Welcome to Login Page'),
              SizedBox(height: 50),
              Textfield(
                controller: emailController,
                hintText: 'Username',
                obscurText: false,
              ),
              SizedBox(height: 10),
              Textfield(
                controller: passwordController,
                hintText: 'Password',
                obscurText: true,
              ),
              SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Text('forgot Password?')],
                ),
              ),

              SizedBox(height: 30),

              Button(onTap: signUp),

              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Divider(thickness: 2)),
                  Text('or continue with'),
                  Expanded(child: Divider(thickness: 2)),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Imagepath(imagepath: 'assets/images/google.png'),
                  SizedBox(width: 10),
                  Imagepath(imagepath: 'assets/images/mac.png'),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Not a member?'),
                  SizedBox(width: 5),
                  Text('Register now', style: TextStyle(color: Colors.blue)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
