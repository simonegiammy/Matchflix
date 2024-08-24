
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:matchflix/style.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;
  final bool isMail;
  const InputField({super.key, required this.hintText, required this.controller,  this.isPassword = false, this.isMail = true});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: isMail ? TextInputType.emailAddress : TextInputType.text,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppStyle.gray.withOpacity(0.2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:const BorderSide(
            color: AppStyle.primaryColor
          )
        ),
        hintText: hintText
      ),
    );
  }
}