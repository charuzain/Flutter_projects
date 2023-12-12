

class CalculatorBrain{

  final int height;
  final int weight;
  late double _result;

  CalculatorBrain({required this.height , required this.weight});


  double bmi(){
   _result = height * 100 / (weight * weight);
    return _result;
  }

  String bmiResult (){
    if(_result < 2){
      return "Overweight";
    }
    else if(_result < 4 ){
      return "Normal";
    }
    else{
      return "Underweight";
    }
  }

  String message(){
    if(_result <2){
      return "Stop eating junk food and start excecising";
    }
    else if(_result <4 ){
      return "You can eat anything";
    }
    else{
      return "Start eating food!!";
    }

  }




}