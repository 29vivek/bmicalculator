import 'package:flutter/material.dart';
import 'package:bmicalc/screens/input_screen.dart';
import 'package:bmicalc/screens/result_screen.dart';
import './constants.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:bmicalc/models/data_model.dart';

void main() => runApp(MyApp());


// any change to the scopedmodel data a.k.a a notifyListeners() does rebuilds all
// ScopedModelDescendants and .of(rebuildOnChange: true) widgets. since we basically
// say that it depends on THAT DATA WHICH WAS CHANGED. 
// so here a change in age actually rebuilds the age, gender, height and weight widgets,
// since we say it depends on only one MODEL. any change => rebuild everything.
// we could separate it as different models.
// scopedmodel changes states for widgets (rebuilds with new value) that are interdependant on certain values (defined in the model)
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