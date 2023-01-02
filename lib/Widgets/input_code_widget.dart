import 'package:flutter/material.dart';

class InputCodeWidget extends StatelessWidget {
  final TextEditingController? controller;
  final bool isFocus;
  final bool onTyping;
  final FocusNode? focusNode;
  const InputCodeWidget({
    this.onTyping = false,
    super.key,
    this.controller,
    this.focusNode,
    this.isFocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      width: 40,
      child: Column(
        children: [
          TextField(
            controller: controller,
            focusNode: focusNode,
            autofocus: onTyping,
            textAlign: TextAlign.center,
            scrollPadding: EdgeInsets.zero,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            cursorColor:Colors.black,
            
            style: const TextStyle(fontSize: 26, color: Colors.black, fontFamily: 'Poppin'),
            decoration: InputDecoration(
              isDense: true,
              hintText: isFocus? '':'0',
              hintStyle:const TextStyle(fontSize: 26, color: Color(0xFFeeeeee), fontFamily: 'Poppin'),
              focusedBorder:const UnderlineInputBorder(// border color
                borderSide: BorderSide(color:  Colors.black,width: 2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}