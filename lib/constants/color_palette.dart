import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

const Color pastelYellow = Color(0xFFFEFDCA);
const Color pastelGreen = Color(0xFFE0F9B5);

const Color darkPink = Color(0xFFB2476B);
const Color pastelPink = Color(0xFFFFCFDF);
const Color darkBlue = Color(0xFF2E8D99);
const Color pastelBlue = Color(0xFFA5DEE5);

const Color brighterPurple = Colors.purple;
const Color darkerPurple = Color(0xFF401197);
const Color grey = Color(0xFF292a2b);

ThemeData appTheme = ThemeData(
     appBarTheme: AppBarTheme(
          color: brighterPurple,
          titleTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
     ),
     colorScheme: ColorScheme.dark().copyWith(onPrimaryContainer: brighterPurple),);
