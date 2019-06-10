import 'package:flutter/material.dart';
import 'package:bmicalc/widgets/reusable_card.dart';
import 'package:bmicalc/widgets/icon_text.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../constants.dart';

class InputScreen extends StatefulWidget {
  @override
  State<InputScreen> createState() {
    return _InputScreenState();
  }

}

class _InputScreenState extends State<InputScreen> {

  double sliderValue = 170.0;
  double age = 18;
  double weight = 50;
  bool isMale = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 7,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPressed: () {
                      setState(() {
                        isMale = true;
                      });
                    },
                    cardColor: isMale ? Color(accent_color) : Color(card_color),
                    cardChild: IconText(
                      MdiIcons.genderMale, 'MALE',
                      iconColor: isMale ? Color(enabled_color) : Color(disabled_color),
                      textColor: isMale ? Color(enabled_color) : Color(disabled_color),
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPressed: () {
                      setState(() {
                        isMale = false;
                      });
                    },
                    cardColor: !isMale? Color(accent_color) : Color(card_color),
                    cardChild: IconText(
                      MdiIcons.genderFemale, 'FEMALE',
                      iconColor: !isMale ? Color(enabled_color) : Color(disabled_color),
                      textColor: !isMale ? Color(enabled_color) : Color(disabled_color),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 8,
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: TextStyle(
                      fontSize: 16.0,
                      letterSpacing: 3.0,
                      fontWeight: FontWeight.w200,
                    )
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        '${sliderValue.floor() }',
                        style: TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        ' cm',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Color(enabled_color),
                      inactiveTrackColor: Color(disabled_color),
                      thumbColor: Color(accent_color),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 24.0),
                      overlayColor: Color(overlay_accent_color),
                    ),
                    child: Slider(
                      min: 120.0,
                      max: 240.0,
                      value: sliderValue,
                      onChanged: (double value) {
                        setState(() {
                          sliderValue = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    ,
                  ),
                ),
                Expanded(
                  child: ReusableCard(

                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: ReusableCard(
              cardColor: Color(accent_color),
              cardChild: SizedBox.expand(
                child: Center(
                  child: Text(
                    'CALCULATE YOUR BMI',
                    style: TextStyle(
                        fontSize: 16.0,
                        letterSpacing: 3.0,
                        color: Color(enabled_color),
                        fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              onPressed: () {
                
              },
            ),
          ),    
        ],
      ),
    );
  }

}