import 'package:flutter/material.dart';
import 'package:food_application_1/Model/user_account.dart';
import 'package:food_application_1/Widgets/app_text.dart';

class HomeScreen extends StatefulWidget {
  final UserAccount userAccount;
  const HomeScreen({
    super.key,
    required this.userAccount,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment:  MainAxisAlignment.center,
            children: [
              AppText.poppin(text: 'Username:  ${widget.userAccount.username}'),
              AppText.poppin(text: 'Email:  ${widget.userAccount.email}'),
              AppText.poppin(text: 'Password:  ${widget.userAccount.password}'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Image.asset('asset/icons/Group 22.png'),label: ''),
          BottomNavigationBarItem(icon: Image.asset('asset/icons/Group 21.png'),label: ''),
          BottomNavigationBarItem(icon: Image.asset('asset/icons/Group 16.png'),label: ''),
          BottomNavigationBarItem(icon: Image.asset('asset/icons/Group 20.png'),label: ''),
        ]
      ),
    );
  }
}