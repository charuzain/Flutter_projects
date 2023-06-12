import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  Result({required this.correctAnswerCount, super.key});
  int correctAnswerCount;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'You have answerd $correctAnswerCount correctly out of Y questions',
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text("List of answers and questions"),
          SizedBox(
            height: 30,
          ),
          OutlinedButton(onPressed: () {}, child: Text("Restart Quiz"))
        ],
      ),
    );
  }
}
