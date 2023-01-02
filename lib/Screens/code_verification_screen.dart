import 'package:flutter/material.dart';
import 'package:food_application_1/Widgets/app_text.dart';
import 'package:food_application_1/Widgets/input_code_widget.dart';
import 'package:food_application_1/Widgets/solid_button.dart';
import 'package:food_application_1/Widgets/toptitle.dart';

class CodeVerificationScreen extends StatefulWidget {
  const CodeVerificationScreen({Key? key}) : super(key: key);

  @override
  State<CodeVerificationScreen> createState() => _CodeVerificationScreenState();
}

class _CodeVerificationScreenState extends State<CodeVerificationScreen> {
  late final TextEditingController _controller1;
  late final TextEditingController _controller2;
  late final TextEditingController _controller3;
  late final TextEditingController _controller4;
  late final FocusNode _focusNode1 ;
  late final FocusNode _focusNode2 ;
  late final FocusNode _focusNode3 ;
  late final FocusNode _focusNode4 ;

  @override
  void initState() {
    super.initState();
    _controller1 = TextEditingController();
    _controller2 = TextEditingController();
    _controller3 = TextEditingController();
    _controller4 = TextEditingController();
    _controller1.addListener((){ setState(() {}); });
    _controller2.addListener((){ setState(() {}); });
    _controller3.addListener((){ setState(() {}); });
    _controller4.addListener((){ setState(() {}); });
    _focusNode1 = FocusNode();
    _focusNode2 = FocusNode();
    _focusNode3 = FocusNode();
    _focusNode4 = FocusNode();
    _focusNode1.addListener((){ setState(() {}); });
    _focusNode2.addListener((){ setState(() {}); });
    _focusNode3.addListener((){ setState(() {}); });
    _focusNode4.addListener((){ setState(() {}); });
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
            //top title
              const TopTitle(firstText: 'Code', secondText: 'Verification'),
              SizedBox(height: MediaQuery.of(context).size.height *0.15,),
            // code input
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildInputCode(_controller1,_focusNode1),
                  _buildInputCode(_controller2,_focusNode2),
                  _buildInputCode(_controller3,_focusNode3),
                  _buildInputCode(_controller4,_focusNode4),
                ],
              ),
              const SizedBox(height: 50,),

            //button
              SolidButton(
                text: 'Verification', 
                onPress: () {Navigator.pushNamed(context,'////changePassword_screen');},
              ),

              SizedBox(height: MediaQuery.of(context).size.height *0.322,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: (() {}), 
                    child:const AppText.poppinBold(text: 'Need help?', size: 14,)
                  ),
                ],
              )
            ],
          ),
        )
      ),
    );
  }

  Widget _buildInputCode(TextEditingController controller, FocusNode focusNode,)
  {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: InputCodeWidget(
        controller: controller,
        focusNode: focusNode,
        isFocus:  focusNode.hasFocus, // state1 return false when focus :true
        onTyping: controller.text.length == 1,
      ),
    );
  }

}