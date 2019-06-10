import 'package:flutter/material.dart';
import 'package:bmicalc/constants.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:bmicalc/models/data_model.dart';
class IconsTexts extends StatelessWidget {

  final String heading;
  final String units;

  IconsTexts({@required this.heading, @required this.units});

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
              '${units.trim().toLowerCase() == 'y' ? ScopedModel.of<DataModel>(context).age : ScopedModel.of<DataModel>(context).weight}',
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
              iconSize: 30.0,
              color: Color(accent_color),
              onPressed: () {
                if(units.trim().toLowerCase() == 'y')
                  ScopedModel.of<DataModel>(context, rebuildOnChange: true).incrementAge();
                else if(units.trim().toLowerCase() == 'kg')
                  ScopedModel.of<DataModel>(context, rebuildOnChange: true).incrementWeight();
              },
            ),
            IconButton(
              icon:Icon(Icons.remove),
              iconSize: 30.0,
              color: Color(accent_color),
              onPressed: () {
                if(units.trim().toLowerCase() == 'y')
                  ScopedModel.of<DataModel>(context, rebuildOnChange: true).decrementAge();
                else if(units.trim().toLowerCase() == 'kg')
                  ScopedModel.of<DataModel>(context, rebuildOnChange: true).decrementWeight();
              },
            ),
          ],
        ),
      ],
    );
  }
}