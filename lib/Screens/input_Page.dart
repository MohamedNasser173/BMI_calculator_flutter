import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../Components/Icon_content.dart';
import '../Components/reusable_card.dart';
import '../Components/constants.dart';
import 'results_page.dart';
import '../Components/button_Down.dart';
import '../Components/calculator_brain.dart';

enum humanGender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  humanGender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onpressed: () {
                      setState(() {
                        selectedGender = humanGender.male;
                      });
                    },
                    colour: selectedGender == humanGender.male
                        ? kActiveCardColor
                        : kInActiveCardColor,
                    cardChild: IconContent('MALE'),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onpressed: () {
                      setState(() {
                        selectedGender = humanGender.female;
                      });
                    },
                    colour: selectedGender == humanGender.female
                        ? kActiveCardColor
                        : kInActiveCardColor,
                    cardChild: IconContent('FEMALE'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.ideographic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumbersStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x15EB1555),
                      activeTrackColor: Colors.white,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        inactiveColor: Color(0xFF8D8E98),
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        }),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'weight',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumbersStyle,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            RoundIconButton(
                              icon: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
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

                    //cardChild:,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'age',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumbersStyle,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            RoundIconButton(
                              icon: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
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
          ButtonDown(
            buttonTitle: 'CALCULATE',
            onTap: () {
              String bmiResult;
              String bmiText;
              String interpretation;
              calculatorBrain calc =
                  calculatorBrain(weight: weight, height: height);
              bmiResult = calc.calculateBmi();
              bmiText = calc.getResult();
              interpretation = calc.getIntrepertation();

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: bmiResult,
                    bmiText: bmiText,
                    interpretation: interpretation,
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

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.onPressed});
  final Icon icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 5.0,
      onPressed: onPressed,
      child: icon,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
