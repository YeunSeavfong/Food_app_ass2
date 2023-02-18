import 'package:flutter/cupertino.dart';
import 'package:food_application_1/Widgets/app_text.dart';

class TopTitle extends StatelessWidget {
  final String firstText;
  final String secondText;
const TopTitle({super.key,required this.firstText, required this.secondText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText.poppinBold(text: firstText,size: 26,),
        AppText.poppinBold(text: secondText, size: 26,),
      ],
    );
  }
}