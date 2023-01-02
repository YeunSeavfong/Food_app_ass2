import 'package:flutter/material.dart';
import 'package:food_application_1/Widgets/app_text.dart';

class SolidButton extends StatelessWidget {
  final String text;
  final void Function()? onPress;
  const SolidButton({super.key, required this.text, this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        primary: const Color(0xFFFFBD2F),
        onPrimary: Colors.black,
        minimumSize:Size(MediaQuery.of(context).size.width-32, 50),
      ),
      child: AppText.poppinBold(text: text),
    );
  }
}