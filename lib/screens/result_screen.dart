import 'package:flutter/material.dart';
import 'package:bmicalc/widgets/reusable_card.dart';
import 'package:bmicalc/constants.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:bmicalc/models/data_model.dart';
class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DataModel model = ScopedModel.of<DataModel>(context);
    final double bmi = model.weight/(model.height*model.height/10000);
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 22,
            child: ReusableCard(
              cardChild: SizedBox.expand(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget> [
                    Text(
                      'YOUR RESULT',
                      style: TextStyle(
                        letterSpacing: 3.0,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      '${bmi.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      bmi < 18.5 ? 'UNDERWEIGHT' : bmi < 25 ? 'NORMAL' : bmi < 30 ? 'OVERWEIGHT' : 'OBESE',
                      style: TextStyle(
                        letterSpacing: 3.0,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              flex: 3,
              child: ReusableCard(
                cardColor: Color(kAccentColor),
                cardChild: SizedBox.expand(
                  child: Center(
                    child: Text(
                      'RE CALCULATE',
                      style: TextStyle(
                          fontSize: 16.0,
                          letterSpacing: 3.0,
                          fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
        ],
      ),
    );
  }
}