import 'package:flutter/material.dart';


class AppTextBold extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  const AppTextBold({Key? key, required this.text, this.size = 35, this.color = Colors.white})
      : super(key: key);

@override
Widget build(BuildContext context) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.bold,
    ),
  );
}
}