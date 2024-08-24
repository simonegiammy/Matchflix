
import 'package:flutter/material.dart';
import 'package:matchflix/style.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isSecondary;
  final bool showOnlyText;
  const PrimaryButton({super.key, required this.text, required this.onPressed, this.isSecondary = false, this.showOnlyText = false});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: const WidgetStatePropertyAll(0),
        backgroundColor: WidgetStateProperty.all<Color>(showOnlyText? Colors.transparent: isSecondary? AppStyle.primaryColor: Colors.blue ),
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      onPressed: onPressed, child:Center(
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontSize:showOnlyText? 16: 18,
          letterSpacing: -1,
          fontWeight: showOnlyText? FontWeight.bold:null,
        ),
      ),
    ));
  }
}