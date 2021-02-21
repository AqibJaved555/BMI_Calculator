import 'package:flutter/material.dart';
import 'constant.dart';
import 'resuseable_card.dart';
import 'input_page.dart';

class ResultPage extends StatelessWidget {

  ResultPage({this.bmiResult, this.resultText, this.inerpretation});

  final String bmiResult;
  final String resultText;
  final String inerpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator", style: labelTextStyle),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text("Your Result", style: KTitleTextStyle),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReuseableCard(
              colour: activeCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(resultText.toUpperCase(), style: KresultTextStyle),
                  Text(bmiResult, style: KBmiTextStyle),
                  Text(
                   inerpretation ,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22.0),
                  )
                ],
              ),
            ),
          ),
          BottomButton(
            buttonTitle: "Re-Calculate",
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
