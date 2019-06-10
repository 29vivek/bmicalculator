import 'package:flutter/material.dart';
import 'package:bmicalc/constants.dart';

class IconsTexts extends StatelessWidget {

  final String heading;
  final double value;
  final String units;

  IconsTexts({@required this.heading, @required this.value, @required this.units});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          heading,
          style: TextStyle(
            letterSpacing: 3.0,
            fontSize: 16.0,
            fontWeight: FontWeight.w300,
            color: Color(enabled_color),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            Text(
              '${value.floor() }',
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              units,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              color: Color(accent_color),
              onPressed: () {
                
              },
            ),
            IconButton(
              icon:Icon(Icons.remove),
              color: Color(accent_color),
              onPressed: () {
                
              },
            ),
          ],
        ),
      ],
    );
  }
}