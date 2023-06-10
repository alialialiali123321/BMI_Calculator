import 'dart:math';

class CalculateBMI {
  CalculateBMI({
    required this.height,
    required this.weight,
  });
  final int height;
  final int weight;
  late double _bmi;

  String calcualateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String feedBack() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight.\nTry to exerices more. Those who are overweight (BMI of 25 to 29.9). it is recommended that you lose weight.';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight. Congratulations.';
    } else {
      return 'Eat more frequently. you are underweight.\nEat may you feel full faster.';
    }
  }
}
