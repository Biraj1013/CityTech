import 'package:flutter/material.dart';

class FirstHeading extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double size;
  final FontWeight fontWeight;

  const FirstHeading({
    Key? key,
    required this.text,
    this.textColor = Colors.black,
    required this.size,
    required this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style:
          TextStyle(fontSize: size, color: textColor, fontWeight: fontWeight),
    );
  }
}
