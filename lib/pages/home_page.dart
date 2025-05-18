import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(child: Text("LOGGED IN!")),
          Container(height: 50, color: Colors.blueGrey),
        ],
      ),
    );
  }
}
