import 'dart:math';

class calculatorBrain {
  final height;
  final weight;
  double _bmi;
  calculatorBrain({this.weight, this.height});
  String calculateBmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25)
      return 'Overweight';
    else if (_bmi >= 18.5)
      return 'Normal';
    else
      return 'UnderWeight';
  }

  String getIntrepertation() {
    if (_bmi >= 25)
      return 'You have a higher than normal body weight.Try to exercise more.';
    else if (_bmi >= 18.5)
      return 'You have a normal body weight .Good job!';
    else
      return 'You have a low than normal body weight . You can eat a bit more.';
  }
}
