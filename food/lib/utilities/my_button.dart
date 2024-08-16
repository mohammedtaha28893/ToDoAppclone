import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  MyButton({
  super.key,
  required this.text,
  required this.onPressed,
  }
);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: const Color.fromARGB(179, 255, 255, 255),
      child: Text(text, style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0))),
    );
  }
}