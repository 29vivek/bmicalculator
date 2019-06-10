import 'package:flutter/material.dart';
import 'package:bmicalc/screens/input_screen.dart';
import 'package:bmicalc/screens/result_screen.dart';
import './constants.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:bmicalc/models/data_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<DataModel>(
      model: DataModel(true, 170, 18, 60),
      child: MaterialApp(
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
      ),
    );
  }
}