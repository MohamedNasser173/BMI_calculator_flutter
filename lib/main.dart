import 'package:flutter/material.dart';
import 'Screens/input_Page.dart';

const mainColor = Color(0xFF0A0E21);

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: mainColor,
        scaffoldBackgroundColor: mainColor,
      ),
      home: InputPage(),
    );
  }
}
