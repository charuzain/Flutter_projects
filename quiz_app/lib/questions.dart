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
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        // mainAxisSize: MainAxisSize.max,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            questionBank[index].question,
            style: const TextStyle(color: Colors.white, fontSize: 32),
          ),
          const SizedBox(
            height: 30,
          ),

          ...questionBank[index].answers.map((answer) => AnswerButton(
                option: answer,
                onClick: () {
                  setState(() {
                    index = index + 1;
                  });
                },
              )),
          // AnswerButton(
          //   option: questionBank[index].answers[0],
          //   onClick: () {
          //     setState(() {
          //       print(questionBank);
          //       index = index + 1;
          //     });
          //   },
          // ),
          // AnswerButton(
          //   option: questionBank[index].answers[1],
          //   onClick: () {
          //     setState(() {
          //       index = index + 1;
          //     });
          //   },
          // ),
          // AnswerButton(
          //   option: questionBank[index].answers[2],
          //   onClick: () {
          //     setState(() {
          //       index = index + 1;
          //     });
          //   },
          // ),
          // AnswerButton(
          //   option: questionBank[index].answers[3],
          //   onClick: () {
          //     setState(() {
          //       index = index + 1;
          //     });
          //   },
          // ),

          // const AnswerButton(),
          // const AnswerButton(),
          // const AnswerButton(),
          // const AnswerButton(),
          // const AnswerButton(),
          // const AnswerButton(),
        ],
      ),
    );
  }
}
