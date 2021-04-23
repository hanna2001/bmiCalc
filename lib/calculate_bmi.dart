import 'dart:math';

class Calculate {
  int height;
  int weight;
  double bmi;
  Calculate({this.weight, this.height});

  String calculateBmi() {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String returnState() {
    if (bmi > 30)
      return 'Obese';
    else if (bmi > 25)
      return 'Over Weight';
    else if (bmi > 18.5)
      return 'Normal';
    else
      return 'Under Weight';
  }

  String returnComment() {
    if (bmi > 30)
      return 'You are a bit obese... exercise and burn your fat';
    else if (bmi > 25)
      return 'Try doing simple workouts';
    else if (bmi > 18.5)
      return 'You are great!!';
    else
      return 'Eat more and be Healthy';
  }
}
