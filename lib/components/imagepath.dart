import 'package:flutter/material.dart';

class Imagepath extends StatelessWidget {
  final String imagepath;
  const Imagepath({super.key, required this.imagepath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Image.asset(imagepath, height: 50),
    );
  }
}
