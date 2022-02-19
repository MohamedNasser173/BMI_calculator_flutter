import 'package:flutter/material.dart';
import '../Components/constants.dart';
import '../Components/reusable_card.dart';
import '../Components/button_Down.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.bmiResult,
      @required this.bmiText,
      @required this.interpretation});

  final String bmiResult;
  final String bmiText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    bmiText.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: kBMITextStyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: ButtonDown(
              buttonTitle: 'RE-CALCULATE',
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ResultPageState extends StatefulWidget {
  // const _ResultPageState({Key? key}) : super(key: key);

  @override
  _ResultPageStateState createState() => _ResultPageStateState();
}

class _ResultPageStateState extends State<_ResultPageState> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
