import 'package:flutter/material.dart';
import 'package:bmicalc/screens/input_screen.dart';
import 'package:bmicalc/screens/result_screen.dart';
import './constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(card_color),
        scaffoldBackgroundColor: Color(background_color),
        accentColor: Color(accent_color),
        brightness: Brightness.dark,
        // textTheme: Typography().white,
      ),
      routes: {
        '/': (context) => InputScreen(),
        '/result': (context) => ResultScreen(),
      }
    );
  }
}