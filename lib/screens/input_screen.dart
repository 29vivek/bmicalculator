import 'package:flutter/material.dart';
import 'package:bmicalc/widgets/reusable_card.dart';
import 'package:bmicalc/widgets/icon_text.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:bmicalc/widgets/icons_texts.dart';
import 'package:bmicalc/constants.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:bmicalc/models/data_model.dart';
import 'package:bmicalc/screens/result_screen.dart';

class InputScreen extends StatelessWidget{

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
            child: ScopedModelDescendant<DataModel>(
                builder: (BuildContext context, Widget child, DataModel model) {
                  return Row(
                    children: <Widget>[
                      Expanded(
                        child: ReusableCard(
                          onPressed: () {
                            model.toggleGender(true);                  
                          },
                          cardColor: model.isMale ? Color(kAccentColor) : Color(kCardColor),
                          cardChild: IconText(
                            MdiIcons.genderMale, 'MALE',
                            iconColor: model.isMale ? Color(kEnabledColor) : Color(kDisabledColor),
                            textColor: model.isMale ? Color(kEnabledColor) : Color(kDisabledColor),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ReusableCard(
                          onPressed: () {
                            model.toggleGender(false);
                          },
                          cardColor: !model.isMale ? Color(kAccentColor) : Color(kCardColor),
                          cardChild: IconText(
                            MdiIcons.genderFemale, 'FEMALE',
                            iconColor: !model.isMale ? Color(kEnabledColor) : Color(kDisabledColor),
                            textColor: !model.isMale ? Color(kEnabledColor) : Color(kDisabledColor),
                          ),
                        ),
                      ),
                    ],
                  );
                },
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
                        '${ScopedModel.of<DataModel>(context).height.floor() }',
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
                      activeTrackColor: Color(kEnabledColor),
                      inactiveTrackColor: Color(kDisabledColor),
                      thumbColor: Color(kAccentColor),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 24.0),
                      overlayColor: Color(kOverlayAccentColor),
                    ),
                    child: Slider(
                      min: 120.0,
                      max: 240.0,
                      value: ScopedModel.of<DataModel>(context).height,
                      onChanged: (double value) {
                        ScopedModel.of<DataModel>(context, rebuildOnChange:true).changeHeight(value);
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
                    cardChild: IconsTexts(
                      heading: 'WEIGHT',
                      units: ' kg',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardChild: IconsTexts(
                      heading: 'AGE',
                      units: ' y',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: ReusableCard(
              cardColor: Color(kAccentColor),
              cardChild: SizedBox.expand(
                child: Center(
                  child: Text(
                    'CALCULATE YOUR BMI',
                    style: TextStyle(
                        fontSize: 16.0,
                        letterSpacing: 3.0,
                        color: Color(kEnabledColor),
                        fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => ResultScreen())
                );
              },
            ),
          ),    
        ],
      ),
    );
  }

}