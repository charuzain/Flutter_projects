import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/answer_button.dart';
import 'data/question_bank.dart';

class Questions extends StatefulWidget {
  const Questions({super.key});
  @override
  State<StatefulWidget> createState() {
    return _QuestionsState();
  }
}

class _QuestionsState extends State<Questions> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        // mainAxisSize: MainAxisSize.max,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "What is flutter popular for in the programming world ?",
            style: TextStyle(color: Colors.white, fontSize: 32),
          ),
          const SizedBox(
            height: 30,
          ),

          AnswerButton(
            question: questionBank[1].answers[0],
          ),
          AnswerButton(
            question: questionBank[1].answers[1],
          ),
          AnswerButton(
            question: questionBank[1].answers[2],
          ),
          AnswerButton(
            question: questionBank[1].answers[3],
          ),

          // const AnswerButton(),
          // const AnswerButton(),
          // const AnswerButton(),
        ],
      ),
    );
  }
}
