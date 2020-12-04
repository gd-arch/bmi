import 'dart:math';

class CalculatorBrain{
  final int height;
  final int weight;
  double _bmi;

  CalculatorBrain({this.height, this.weight});
  String calculateBmi(){
_bmi=weight/pow(height/100, 2);
return _bmi.toStringAsFixed(1);

  }
  String getResult(){
    if(_bmi>=25) return'Over'
        'Weight';
    else if(_bmi>18.5) return 'normal';
    else {
      return 'Underweight';
    }
}
String getInterpretation(){
  if(_bmi>=25) return'You have a higher than normal body weight.Try to have a balanced diet ';
  else if(_bmi>18.5) return 'You have a normal body weight.Good Job!';
  else {
    return 'You have a lower body weight than normal.Try to have a balanced diet';
  }
}


}