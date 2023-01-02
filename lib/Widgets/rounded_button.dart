import 'package:flutter/material.dart';
import 'package:food_application_1/Widgets/app_text.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  
  const RoundedButton({
    super.key,
    this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width *0.5,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            
          ),
          backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFFFBD2F)),
          foregroundColor: MaterialStateProperty.all<Color>( const Color(0xFF000000)),
        ),
        child: AppText.poppinBold(text: text),
      ),
    );
  }
}