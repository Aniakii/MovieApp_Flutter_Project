import 'package:flutter/material.dart';

const Color brighterPurple = Colors.purple;
const Color darkerPurple = Color(0xFF401197);
const Color grey = Color(0xff303030);

ThemeData appTheme = ThemeData(
     appBarTheme: const AppBarTheme(
          color: brighterPurple,
          titleTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
     ),
     colorScheme: ColorScheme.dark());
