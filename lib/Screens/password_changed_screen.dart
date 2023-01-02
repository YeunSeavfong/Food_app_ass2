import 'package:flutter/material.dart';
import 'package:food_application_1/Widgets/rounded_button.dart';
import 'package:food_application_1/Widgets/solid_button.dart';
import 'package:food_application_1/Widgets/toptitle.dart';

class PasswordChangedScreen extends StatefulWidget {
  const PasswordChangedScreen({Key? key}) : super(key: key);

  @override
  State<PasswordChangedScreen> createState() => _PasswordChangedScreenState();
}

class _PasswordChangedScreenState extends State<PasswordChangedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height *0.1,),
              // top title
                const TopTitle(firstText: 'Password', secondText: 'Changed!'),
                SizedBox(height: MediaQuery.of(context).size.height *0.05,),
              // image
                Image.asset('asset/icons/lock_key.png',scale: 1.5,),

                SizedBox(height: MediaQuery.of(context).size.height *0.25,),
              // button
                RoundedButton(text: 'Get Started',onPressed: () {},)
              ]
            ),
          ),
        ),
      ),
    );
  }
}