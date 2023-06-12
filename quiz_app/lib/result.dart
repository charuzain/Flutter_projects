import 'package:flutter/cupertino.dart';

class Result extends StatelessWidget {
  Result({required this.correctAnswerCount, super.key});
  int correctAnswerCount;

  @override
  Widget build(BuildContext context) {
    return Text('You have answerd $correctAnswerCount correctly');
  }
}
