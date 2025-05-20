import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_page/components/button.dart';
import 'package:login_page/components/imagepath.dart';
import 'package:login_page/components/textfield.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  //ontap fonction
  void signUp() async {
    //show loadin circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );

    //try sign in

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // pop the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      Navigator.pop(context);
      //wrong Email
      if (e.code == 'user-not-found') {
        wrongEmailMessage();
      }
      //wrong Password
      else if (e.code == 'wrong-password') {
        //show error to user
        wrongPasswordMessage();
      }
    }
  }

  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(title: Text('Incorrect Email'));
      },
    );
  }

  void wrongPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(title: Text('Incorrect Password'));
      },
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
