import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'resuseable_card.dart';
import 'constant.dart';
import 'result_page.dart';
import 'calculator_brain.dart';

enum Gender { male, female }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Gender selectedGender;
  var height = 180;
  var weight = 60;
  var age = 18;

  // Color maleCardColor = inActiveCardColour;
  // Color femaelCardColor = inActiveCardColour;

  // void updateColour(Gender selectedGender) {
  //   if (selectedGender == Gender.male) {
  //     if (maleCardColor == inActiveCardColour) {
  //       maleCardColor = activeCardColour;
  //       femaelCardColor = inActiveCardColour;
  //     } else {
  //       maleCardColor = inActiveCardColour;
  //     }
  //   }
  //   if (selectedGender == Gender.female) {
  //     if (femaelCardColor == inActiveCardColour) {
  //       femaelCardColor = activeCardColour;
  //       maleCardColor = inActiveCardColour;
  //     } else {
  //       femaelCardColor = inActiveCardColour;
  //     }
  //   }

  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: new ReuseableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? activeCardColour
                        : inActiveCardColour,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: "MALE",
                    ),
                  ),
                ),
                Expanded(
                  child: new ReuseableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? activeCardColour
                        : inActiveCardColour,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: "FEMALE",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReuseableCard(
              colour: activeCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "HEIGHT",
                    style: labelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(height.toString(), style: KnumberTextStyle),
                      Text("cm", style: KnumberTextStyle),
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                      thumbColor: Color(0XFFEB1555),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0XFF8d8E98),
                      overlayColor: Color(0XFFEB1555),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      activeColor: Colors.white,
                      inactiveColor: Color(0XFF8d8E98),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: new ReuseableCard(
                    colour: activeCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("WEIGHT", style: labelTextStyle),
                        Text(
                          weight.toString(),
                          style: KnumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: new ReuseableCard(
                    colour: activeCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("AGE", style: labelTextStyle),
                        Text(
                          age.toString(),
                          style: KnumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: "Calculate",
            onTap: () {
              CalculatorBrain cal =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: cal.getBMI(),
                    resultText: cal.getResult(),
                    inerpretation: cal.getInerpretation(),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  BottomButton({this.buttonTitle, this.onTap});
  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        child: Text(buttonTitle, style: KLargeButtonTextStyle),
        color: bottomContainerColour,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: bottomContainerHeight,
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(height: 50.0, width: 50.0),
      shape: CircleBorder(),
      fillColor: Color(0XFF4c4f5E),
    );
  }
}
