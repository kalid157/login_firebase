import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Function()? onTap;
  Button({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text('sign in', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
