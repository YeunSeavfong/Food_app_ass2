import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_application_1/Model/user_account.dart';
import 'package:food_application_1/Widgets/app_text.dart';
import 'package:food_application_1/Widgets/outlined_button.dart';
import 'package:food_application_1/Widgets/solid_button.dart';
import 'package:food_application_1/Widgets/textfield_widget.dart';
import 'package:food_application_1/Widgets/toptitle.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  
  late UserAccount userAccount;
  late bool isVisibility ;
  late final TextEditingController fullnameController;
  late final TextEditingController emialController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmController;
  late String username;
  late String password;
  late String email;

  @override
  void initState() {
    super.initState();
    isVisibility = false;
    fullnameController = TextEditingController();
    emialController = TextEditingController();
    passwordController = TextEditingController();
    confirmController = TextEditingController();
    fullnameController.addListener(() {setState(() {
      
    }); });
    emialController.addListener(() {setState(() {
      
    }); });
    passwordController.addListener(() {setState(() {
      
    }); });
    confirmController.addListener(() {setState(() {
      
    }); });
  }
  @override
  void dispose() {
    fullnameController.dispose();
    emialController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }
  void _clearText(){
    fullnameController.clear();
    emialController.clear();
    passwordController.clear();
    confirmController.clear();
  }

  @override
  Widget build(BuildContext context) {
    username = fullnameController.text;
    email = emialController.text;
    password = passwordController.text;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            // top title
              SizedBox(height: MediaQuery.of(context).size.height *0.07,),
              const TopTitle(firstText: 'Register', secondText: 'New account'),
            // textfield
              SizedBox(height: MediaQuery.of(context).size.height *0.1,),
              _buildNameTextField(),
              const Divider(height: 1,),
              _buildEmailTextField(),
              const Divider(height: 1,),
              _buildPasswordTextField('Password', passwordController),
              const Divider(height: 1,),
              _buildPasswordTextField('Confirm password', confirmController),
              const Divider(height: 1,),
            
            // button
              const SizedBox(height: 20,),
              SolidButton(
                text: 'Register',
                onPress:(() {
                  createUser(username: username, email: email, password: password);
                  Navigator.pushNamed(
                      context, 
                      'Vhome_screen',
                      arguments: UserAccount(username: username, email: email, password: password)
                  );
                })
              ),
              const SizedBox(height: 10,),
              const OutlineButton(text: 'Sign up with facebook',),

            // bottom text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AppText.poppin(text: "Already have an account?",size: 14,),
                  TextButton(
                    onPressed: ((){
                      Navigator.pushNamed(context, '/login_screen',arguments: userAccount);
                    }), 
                    child: const AppText.poppinBold(text: 'Login',size: 14,)
                  ),
                ],
              )
              
            ],
          )
        )
      ),
    );
  }

  Widget _buildEmailTextField(){
    return TextFieldWidget(
      labelText: 'Email',
      controller: emialController,
      isEmail: true,
      icon: Icons.email_outlined,
      iconWhenType: Icons.clear_rounded,
      onPressedIcon: (() => emialController.clear()),
      noTyping: emialController.text.isEmpty,

    );
  }
  //
  Widget _buildPasswordTextField(String text,TextEditingController controller){
    return TextFieldWidget(
      labelText: text,
      controller: controller,
      isobscure: !isVisibility,
      icon: Icons.lock_outline,
      iconWhenType: isVisibility? Icons.visibility: Icons.visibility_off,
      noTyping: controller.text.isEmpty,
      onPressedIcon: (() => setState(() {isVisibility = !isVisibility;})),

    );
  }
  //
  Widget _buildNameTextField(){
    return TextFieldWidget(
      labelText: 'Full name',
      controller: fullnameController,
      icon: Icons.recent_actors_outlined,
      iconWhenType: Icons.clear_rounded,
      onPressedIcon: (() => fullnameController.clear()),
      noTyping: fullnameController.text.isEmpty,

    );
  }
// read data into firebase
  Future createUser({required String username, required String email, required String password})async{
    final docUser = FirebaseFirestore.instance.collection('user').doc();
    final user = UserAccount(username: username, email: email, password:  password);
    final json = user.toJson(); // return map of user info

    await docUser.set(json);
  }

}