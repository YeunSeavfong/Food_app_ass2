import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_application_1/Model/user_account.dart';
import 'package:food_application_1/Widgets/app_text.dart';
import 'package:food_application_1/Widgets/outlined_button.dart';
import 'package:food_application_1/Widgets/solid_button.dart';
import 'package:food_application_1/Widgets/textfield_widget.dart';
import 'package:food_application_1/Widgets/toptitle.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController emialController;
  late final TextEditingController passwordController;
  late bool isVisibility = false;
  late String email;
  late String password;
  
  @override
  void initState() {
    super.initState();
    emialController = TextEditingController();
    passwordController = TextEditingController();
    emialController.addListener(() {
      setState(() { });
    });
    passwordController.addListener(() {
      setState(() {
        isVisibility = false;
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    email = emialController.text;// get text from text field
    password = passwordController.text;// get text from text field
    return Scaffold(
      body: StreamBuilder<List<UserAccount>>(
        stream: readUser(),
        builder: (context, snapshot) {// snapshot is the list of UserAccount
          // if error
          if(snapshot.hasError){
            return const Center(
              child: CircularProgressIndicator(backgroundColor: Colors.black,)
            );
          }
          // completed
          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                // top title
                  SizedBox(height: MediaQuery.of(context).size.height *0.07,),
                  const TopTitle(firstText: 'Login to', secondText: 'find the best food'),
                // textfield
                  SizedBox(height: MediaQuery.of(context).size.height *0.1,),
                  _buildEmailTextField(),
                  const Divider(height: 1,),
                  _buildPasswordTextField(),
                  const Divider(height: 1,),
                // forget password text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: ((){
                          Navigator.pushNamed(context, '//forgotPassword_screen');
                        }), 
                        child: const AppText.poppin(text: 'Forget password?',size: 14,)
                      )
                    ],
                  ),
                // button
                  const SizedBox(height: 20,),
      
                  SolidButton(
                    text: 'Sign in',
                    onPress: (){
                      _onPressedButton(snapshot.data!); // snapshot.data return list of userAccounts
                    },
                  ),
      
                  const SizedBox(height: 20,),
                  const OutlineButton(text: 'Sign up with facebook',),
      
                // bottom text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const AppText.poppin(text: "Don't have an account?",size: 14,),
                      TextButton(
                        onPressed: (() {
                          Navigator.pushNamed(context, '//register_screen');
                        }), 
                        child: const AppText.poppinBold(text: 'Register',size: 14,)
                      ),
                    ],
                  )
                  
                ],
              )
            )
          );
        }
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
      noTyping: emialController.text.isEmpty,// state 1 return true
      onPressedIcon: () {emialController.clear();},
    );
  }
  Widget _buildPasswordTextField(){
    return TextFieldWidget(
      labelText: 'Password',
      controller: passwordController,
      isobscure: !isVisibility,
      icon: Icons.lock_outlined,
      iconWhenType: isVisibility? Icons.visibility_outlined:Icons.visibility_off_outlined,
      noTyping: passwordController.text.isEmpty,// state1 retrun true when typing return false
      onPressedIcon: () {
        setState(() {
          isVisibility = !isVisibility;
        });
      },
    );
  }
  // get data form firebase type Stream<List<UserAccount>>
  Stream<List<UserAccount>> readUser(){
    return FirebaseFirestore.instance.collection('user')
          .snapshots()
          .map((snapshots) => snapshots.docs.map((docs) => UserAccount.fromJson(docs.data())).toList());
    }

  // when pressed button login
  void _onPressedButton(List<UserAccount> userlist){
    bool ishasUser = false;
    //check account to login
    for(var i=0; i<userlist.length; i++){
      if(userlist[i].email==email && userlist[i].password== password){
        Navigator.pushNamed(context, 'Vhome_screen',arguments:userlist[i]);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const AppText.poppin(text:'Login successfully!', size: 14,),
            backgroundColor: Colors.green[400],
        ));
        ishasUser = true;
        break;
      }
    }
    if(!ishasUser){
        ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(
            content: const AppText.poppin(text:'Incorrect email or password!!', size: 14,),
            backgroundColor: Colors.red[400],
          )
        );
    }
    
  }
}