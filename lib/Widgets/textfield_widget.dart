import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String labelText;
  final IconData? iconWhenType;
  final IconData? icon;
  final bool isEmail;
  final bool isobscure;
  final bool noTyping;
  final void Function()? onPressedIcon;
  final TextEditingController? controller;

  const TextFieldWidget({
    this.noTyping = false,
    this.onPressedIcon,
    super.key,
    required this.labelText,
    this.isEmail = false,
    this.isobscure = false,
    this.iconWhenType,
    this.icon,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: isEmail? TextInputType.emailAddress: TextInputType.text,
      obscureText: isobscure,
      obscuringCharacter: '*',
      style: const TextStyle(fontFamily: 'Poppin',color: Colors.black,fontSize: 16),
      decoration: InputDecoration(
        labelText: labelText,
        hintText: 'Enter ${labelText.toLowerCase()}...',
        border: InputBorder.none,
        suffixIcon: 
          noTyping? Icon(icon) // email icon (onfocus = tru)
          :IconButton(
            onPressed: onPressedIcon, 
            icon: Icon(iconWhenType)
          ),
        labelStyle: const TextStyle(fontFamily: 'Poppin',color: Colors.grey,fontSize: 16),
        hintStyle: const TextStyle(fontFamily: 'Poppin',color: Colors.grey,fontSize: 16),
      ),
    );
  }
}