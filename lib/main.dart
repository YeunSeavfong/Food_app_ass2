import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_application_1/Model/user_account.dart';
import 'package:food_application_1/Screens/change_password_screen.dart';
import 'package:food_application_1/Screens/code_verification_screen.dart';
import 'package:food_application_1/Screens/forget_password_screen.dart';
import 'package:food_application_1/Screens/home_screen.dart';
import 'package:food_application_1/Screens/login_screen.dart';
import 'package:food_application_1/Screens/password_changed_screen.dart';
import 'package:food_application_1/Screens/register_screen.dart';
import 'Screens/slash_screen.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(const FoodApp());
}

class FoodApp extends StatelessWidget {
  const FoodApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: const SlashScreen(),
      debugShowCheckedModeBanner: false,

      initialRoute: '/',
      onGenerateRoute: (settings){
        if(settings.name=='/'){
          return MaterialPageRoute(builder: ((context) => const SlashScreen()));
        }
        else if(settings.name == '/login_screen'){
          return MaterialPageRoute(builder: ((context) => const LoginScreen()));
        }
        else if(settings.name == '//register_screen'){
          return MaterialPageRoute(builder: ((context) {

            return const RegisterScreen();
          }));
        }
        else if(settings.name == '//forgotPassword_screen'){
          return MaterialPageRoute(builder: ((context) => const ForgetPasswordScreen()));
        }
        else if(settings.name == '///codeVerified_screen'){
          return MaterialPageRoute(builder: ((context) => const CodeVerificationScreen()));
        }
        else if(settings.name == '////changePassword_screen'){
          return MaterialPageRoute(builder: ((context) => const ChangePasswordScreen()));
        }
        else if(settings.name == '/VpasswordChanged_screen'){
          return MaterialPageRoute(builder: ((context) => const PasswordChangedScreen()));
        }
        else if(settings.name == 'Vhome_screen'){
          return MaterialPageRoute(builder: ((context) {
            final arg = settings.arguments as UserAccount;
            return HomeScreen(userAccount: arg,);
          }));
        }
        return null;
      },
    );
  }
}