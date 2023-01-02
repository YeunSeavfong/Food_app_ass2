import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final Color color;
  final String text;
  final double size;
  final String? fontFamily;
  const AppText({
    super.key,
    required this.text,
    this.size = 20,
    this.color = Colors.black,
    this.fontFamily,
  });
  const AppText.poppin({
    super.key,
    required this.text,
    this.size = 20,
    this.color = Colors.black,
    this.fontFamily = 'Poppin',
  });
  const AppText.poppinBold({
    super.key,
    required this.text,
    this.size = 16,
    this.color = Colors.black,
    this.fontFamily='PoppinBold',
  });


  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: fontFamily,
        fontSize: size,
        color: color,
      ),
    );
  }
}