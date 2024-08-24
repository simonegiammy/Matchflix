
import 'package:flutter/material.dart';

class AppStyle{
  static const darkBlue = Color.fromRGBO(18, 24, 41, 1);
    static const primaryColor = Color.fromRGBO(72, 16, 53, 1);
  static const gray = Color(0xff858585);
  static ThemeData getTheme(){
    return ThemeData.dark(
      
    ).copyWith(
      scaffoldBackgroundColor: darkBlue,
      textTheme: const TextTheme(
        headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
      )
    );
  }
}