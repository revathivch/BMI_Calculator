import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';

const bottomContainerHeight = 80.0;
const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
const bottomContainerColor = Color(0xFFEB1555);



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

  Color maleCardColour = inactiveCardColor;
  Color femaleCardColour = inactiveCardColor;

  late Gender selectedGender;

  // void updateColour(Gender selectedGender){
  //   if(selectedGender == Gender.male){
  //     if(maleCardColour == inactiveCardColor){
  //       maleCardColour = activeCardColor;
  //       femaleCardColour = inactiveCardColor;
  //     }
  //     else{
  //       maleCardColour = inactiveCardColor;
  //     }
  //   }
  //   if(selectedGender == Gender.female){
  //     if(femaleCardColour == inactiveCardColor){
  //       femaleCardColour = activeCardColor;
  //       maleCardColour = inactiveCardColor;
  //     }
  //     else{
  //       femaleCardColour = inactiveCardColor;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child:Text("BMI Calculator"),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      child: ReusableCard(
                          colour: selectedGender == Gender.male ? activeCardColor : inactiveCardColor,
                          cardChild: IconContent(icon: FontAwesomeIcons.mars, label: 'MALE'),
                      ),
                    )
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      child: ReusableCard(
                        colour: selectedGender == Gender.female ? activeCardColor : inactiveCardColor, // This turnary operator is able to replace the entire function updateColor()
                        cardChild: IconContent(icon: FontAwesomeIcons.venus, label: "FEMALE",),
                      ),
                    )
                  ),
                ],
              )
          ),
          Expanded(
              child: ReusableCard(
                  colour: activeCardColor,
                  cardChild: IconContent(),
              )
              ),
          Expanded(
              child: Row(
                children: [
                  Expanded(
                    child:  ReusableCard(
                        colour: activeCardColor,
                        cardChild: IconContent(),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                        colour: activeCardColor,
                        cardChild: IconContent(),
                    ),
                  ),
                ],
              )
          ),
          Container(
            color: bottomContainerColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerHeight,
          )
        ],
      )
    );
  }
}





