import 'package:flutter/material.dart';
import 'package:food_application_1/Widgets/app_text.dart';

class OutlineButton extends StatelessWidget {
  final String text;
  const OutlineButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: (() {}),
      style: OutlinedButton.styleFrom(
        primary: Colors.black,
        minimumSize:Size(MediaQuery.of(context).size.width-32, 50),
        side: const BorderSide(width: 2, color: Colors.black),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          const Icon(Icons.facebook_outlined),
          AppText.poppinBold(text: text),
        ],
      ),
    );
  }
}