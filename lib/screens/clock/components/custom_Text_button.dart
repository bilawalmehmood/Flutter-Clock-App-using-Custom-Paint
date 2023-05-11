import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String title;
  final String imagePath;
  const CustomTextButton(
      {super.key, required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Column(
        children: [
          Image.asset(
            imagePath,
            scale: 1.5,
          ),
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontFamily: "avenir"),
          ),
        ],
      ),
    );
  }
}
