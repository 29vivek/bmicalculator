import 'package:flutter/material.dart';
import '../constants.dart';

class ReusableCard extends StatelessWidget {

  final Widget cardChild;
  final Color cardColor;
  final Function onPressed;

  ReusableCard({@required this.cardChild, this.cardColor, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        margin: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          color: cardColor ?? Color(card_color),
          boxShadow: [BoxShadow(
            color: Color(card_color),
            blurRadius: 10,
            offset: Offset(1, 4),
          )],
        ),
        child: cardChild,
      ),
    );
  }
}