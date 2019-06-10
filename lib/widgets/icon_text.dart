import 'package:flutter/material.dart';
class IconText extends StatelessWidget {

  IconText(this.iconData, this.text, {@required this.iconColor, @required this.textColor});
  
  final IconData iconData;
  final String text;

  final Color iconColor;
  final Color textColor;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Icon(
            iconData,
            size: 60.0,
            color: iconColor,
        ),
        Text(
          text,
          style: TextStyle(
            letterSpacing: 3.0,
            fontSize: 16.0,
            fontWeight: FontWeight.w300,
            color: textColor,
          ),
        ),
      ],
    );
  }
}