import 'package:flutter/material.dart';
import 'package:food_application_1/Screens/login_screen.dart';
import 'package:food_application_1/Widgets/app_text.dart';

class SlashScreen extends StatefulWidget {
  const SlashScreen({Key? key}) : super(key: key);

  @override
  State<SlashScreen> createState() => _SlashScreenState();
}

class _SlashScreenState extends State<SlashScreen> {
  late bool loading = true;

  @override
  void initState() {
    super.initState();

    _loading().then((value){
      setState(() {
        loading = false;
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    if(loading){
      return Scaffold(
        backgroundColor:const Color(0xFFFFBD2F),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    width: 70,
                    height: 70,
                    color: Colors.black,
                    child: Image.asset('asset/icons/Logo.png',width: 50,height: 50,),
                  ),
                ),
                const AppText.poppin(text: 'Foodes App',size: 22,),
                SizedBox(height: MediaQuery.of(context).size.height *0.05,),
                const CircularProgressIndicator(color: Colors.black,)
              ],
            ),
          )
        ),
      );}
    return const LoginScreen();
  }

  Future _loading()async{
    await Future.delayed(const Duration(seconds: 5));
  }
}