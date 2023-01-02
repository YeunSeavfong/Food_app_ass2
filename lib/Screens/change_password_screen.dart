import 'package:flutter/material.dart';
import 'package:food_application_1/Widgets/app_text.dart';
import 'package:food_application_1/Widgets/solid_button.dart';
import 'package:food_application_1/Widgets/textfield_widget.dart';
import 'package:food_application_1/Widgets/toptitle.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  late final TextEditingController passController ;
  late final TextEditingController confirmController;
  late bool isVisibility = false;

  @override
  void initState() {
    super.initState();
    passController = TextEditingController();
    confirmController = TextEditingController();
    passController.addListener(() { 
      setState(() {
      });
    });

    confirmController.addListener(() { 
      setState(() {
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height *0.07,),
              const TopTitle(firstText: 'Change', secondText: 'Password'),
              SizedBox(height: MediaQuery.of(context).size.height *0.15,),
            // textfield
              _buildTextField('Password', passController),
              const Divider(height: 1,),
              _buildTextField('Confirm password', confirmController),
              const Divider(height: 1,),
            // telling text
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: AppText.poppin(
                  text: "Please remember your password and don't share any data to other people",
                  color: Colors.grey,
                  size: 12,
                ),
              ),
            // button
              SolidButton(
                text: 'Change Password',
                onPress: () => Navigator.pushNamed(context, '/VpasswordChanged_screen'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String text, TextEditingController controller)
  {
    return TextFieldWidget(
      labelText: text,
      controller: controller,
      isobscure: !isVisibility,
      icon: Icons.lock_outlined,
      iconWhenType: isVisibility? Icons.visibility_outlined :Icons.visibility_off_outlined,
      noTyping: controller.text.isEmpty,
      onPressedIcon: (() {
        setState(() {
          isVisibility = !isVisibility;
        });
      }),
    );
  }
}