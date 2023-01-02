import 'package:flutter/material.dart';
import 'package:food_application_1/Widgets/app_text.dart';
import 'package:food_application_1/Widgets/solid_button.dart';
import 'package:food_application_1/Widgets/textfield_widget.dart';
import 'package:food_application_1/Widgets/toptitle.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreen();
}

class _ForgetPasswordScreen extends State<ForgetPasswordScreen> {
  final TextEditingController emialController = TextEditingController();

    @override
  void initState() {
    super.initState();
    emialController.addListener(() {
      setState(() {});
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            // top title
              SizedBox(height: MediaQuery.of(context).size.height *0.07,),
              const TopTitle(firstText: 'Forgot', secondText: 'Password'),
            // textfield
              SizedBox(height: MediaQuery.of(context).size.height *0.15,),
              buildEmail(),
              const Divider(height: 1,),
            // telling text
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: AppText.poppin(
                  text: "Please provide your email to reset your password, please don't share any data to other people",
                  size: 14,
                  color: Colors.grey,
                ),
              ),
            // button
              const SizedBox(height: 20,),
              SolidButton(
                text: 'Reset Password',
                onPress: (() => Navigator.pushNamed(context, '///codeVerified_screen')),
              ),

            // bottom text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AppText.poppin(text: "Remember now?",size: 14,),
                  TextButton(
                    onPressed: (() {
                      Navigator.pushNamed(context, '/login_screen');
                    }), 
                    child: const AppText.poppinBold(text: 'Login here',size: 14,)
                  ),
                ],
              ),
            // Need help text
              SizedBox(height: MediaQuery.of(context).size.height * 0.14,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: (() {}), 
                    child: const AppText.poppinBold(text: 'Need help?', size: 14,)
                  ),
                ],
              )
            ],
          )
        )
      ),
    );
  }

  Widget buildEmail(){
    return TextFieldWidget(
      controller: emialController,
      labelText: 'Email',
      icon: Icons.email_outlined,
      iconWhenType: Icons.clear_rounded,
      noTyping: emialController.text.isEmpty,// state1 true
      isEmail: true,
      onPressedIcon:(() {emialController.clear();} )
    );
  }
}