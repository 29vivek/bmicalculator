import 'package:flutter/material.dart';
import 'package:bmicalc/widgets/reusable_card.dart';
import 'package:bmicalc/widgets/icon_text.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:bmicalc/widgets/icons_texts.dart';
import 'package:bmicalc/constants.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:bmicalc/models/data_model.dart';


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
            child: Row(
              children: <Widget>[
                ScopedModelDescendant<DataModel>(
                  builder: (BuildContext context, Widget child, DataModel model) {
                    return Expanded(
                      child: ReusableCard(
                        onPressed: () {
                          model.toggleGender(true);
                          
                        },
                        cardColor: model.isMale ? Color(accent_color) : Color(card_color),
                        cardChild: IconText(
                          MdiIcons.genderMale, 'MALE',
                          iconColor: model.isMale ? Color(enabled_color) : Color(disabled_color),
                          textColor: model.isMale ? Color(enabled_color) : Color(disabled_color),
                        ),
                      ),
                    );
                  },
                ),
                ScopedModelDescendant<DataModel>(
                  builder: (BuildContext context, Widget child, DataModel model) {
                    return Expanded(
                      child: ReusableCard(
                        onPressed: () {
                          model.toggleGender(false);
                        },
                        cardColor: !model.isMale ? Color(accent_color) : Color(card_color),
                        cardChild: IconText(
                          MdiIcons.genderFemale, 'FEMALE',
                          iconColor: !model.isMale ? Color(enabled_color) : Color(disabled_color),
                          textColor: !model.isMale ? Color(enabled_color) : Color(disabled_color),
                        ),
                      ),
                    );
                  },
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