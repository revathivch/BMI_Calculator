import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender{
  male,
  female,
}

class _InputPageState extends State<InputPage> {

  Color maleCardColour = kInactiveCardColor;
  Color femaleCardColour = kInactiveCardColor;

  Gender? selectedGender;
  int? height = 180;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child:Text("BMI CALCULATOR"),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                        colour: selectedGender == Gender.male ? kActiveCardColor : kInactiveCardColor,
                        cardChild: IconContent(icon: FontAwesomeIcons.mars, label: 'MALE'),
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                    )
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: selectedGender == Gender.female ? kActiveCardColor : kInactiveCardColor, // This turnary operator is able to replace the entire function updateColor()
                      cardChild: IconContent(icon: FontAwesomeIcons.venus, label: "FEMALE",),
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                    )
                  ),
                ],
              )
          ),
          Expanded(
              child: ReusableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'HEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center, // To center the row
                        crossAxisAlignment: CrossAxisAlignment.baseline, // Cross axis is to the center of the column
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            height.toString(),
                            style: kNumberTextStyle,
                          ),
                          const Text(
                            'cm',
                            style: kLabelTextStyle,
                          )
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x29EB1555), // To modify the transparency, we will modify the first third and the fourth characters in the color code
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: const Color(0xFF8D8E98),
                        ),
                        child: Slider(
                          value: height!.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                          },
                        ),
                      ),
                    ],
                  ),
                  onPress: () {  },
              )
              ),
          // Expanded(
          //     child: Row(
          //       children: [
          //         Expanded(
          //           child:  ReusableCard(
          //               colour: kActiveCardColor,
          //               cardChild: IconContent(),
          //           ),
          //         ),
          //         Expanded(
          //           child: ReusableCard(
          //               colour: kActiveCardColor,
          //               cardChild: IconContent(),
          //           ),
          //         ),
          //       ],
          //     )
          // ),
          Container(
            color: kBottomContainerColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: kBottomContainerHeight,
          )
        ],
      )
    );
  }
}





