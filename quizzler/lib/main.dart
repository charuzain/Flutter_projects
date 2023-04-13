import 'package:flutter/material.dart';
import 'package:quizzler/question_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const MaterialApp(
        home: Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: QuizApp(),
        ),
      ),
      backgroundColor: Colors.black54,
    ));
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  // int num = 0;

  List<Icon> scoreKeeper = [];
  QuestionBank ques = QuestionBank();

  void checkAnswer (bool userSelectedAnswer){
    setState(() {

      if (ques.getAnswer(ques.num) == userSelectedAnswer) {
        scoreKeeper.add(const Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        scoreKeeper.add(const Icon(
          Icons.clear,
          color: Colors.red,
        ));
      }
      ques.increaseCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Center(
              child: Text(
                ques.getQuestion(ques.num),
                style: const TextStyle(color: Colors.white70, fontSize: 28),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                if(ques.isFinished(ques.num) == true){
                  //alert
                  Alert(
                    context: context,
                    type: AlertType.error,
                    title: "End of Quiz",
                    desc: "Do you want to play again.",
                    buttons: [
                      DialogButton(
                        child: Text(
                          "Restat",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () => Navigator.pop(context),
                        width: 120,
                      )
                    ],
                  ).show();
                }
                else {
                  checkAnswer(true);
                }


              },
              child: const Text(
                'True',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              onPressed: () {
                if(ques.isFinished(ques.num) == true){
                  Alert(
                    context: context,
                    type: AlertType.error,
                    title: "RFLUTTER ALERT",
                    desc: "Flutter is more awesome with RFlutter Alert.",
                    buttons: [
                      DialogButton(
                        child: Text(
                          "COOL",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () => Navigator.pop(context),
                        width: 120,
                      )
                    ],
                  ).show();
                }
                else {
                  checkAnswer(false);
                }
                // setState(() {
                //   if (ques.getAnswer(ques.num) == false) {
                //     scoreKeeper.add(const Icon(
                //       Icons.check,
                //       color: Colors.green,
                //     ));
                //   } else {
                //     scoreKeeper.add(const Icon(
                //       Icons.clear,
                //       color: Colors.red,
                //     ));
                //   }
                //   ques.increaseCount();
                // });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
          ),
        ),
        Row(children: scoreKeeper)
      ],
    );
  }
}
