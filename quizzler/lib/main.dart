import 'package:flutter/material.dart';
import 'question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
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
  int num = 0;

  // Question q1 = new Question('Slug\'s blood is green ?', true);
  // Question q2 = new Question('Canada is in South America', false);
  // Question q3 = new Question('I\'m an Indian', false);
  //
  // List <Question> questionBank = [q1,q2,q3];

  List<Question> questions = [
    Question(q:'Slug\'s blood is green ?', a:true),
    Question(q:'Canada is in South America',a: false),
    Question(q:'I\'m an Indian', a:false)
  ];


  // List<String> questions = ['Slug\'s blood is green ?',
  // 'Canada is in South America',
  // 'I\'m an Indian'];
  //
  //
  // List <bool> answers = [true , false , true];

  List<Icon> scoreKeeper = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Center(
              child: Text(
                questions[num].question,
                style: TextStyle(color: Colors.white70, fontSize: 28),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              child: Text(
                'True',
                style: TextStyle(fontSize: 24),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                print(questions[num].question);
                setState(() {
                  print(num);
                  if (questions[num].answer == true) {
                    scoreKeeper.add(Icon(
                      Icons.check,
                      color: Colors.green,
                    ));
                  } else {
                    scoreKeeper.add(Icon(
                      Icons.clear,
                      color: Colors.red,
                    ));
                  }
                  num = num + 1;
                  print(num);
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  if (questions[num].answer == false) {
                    scoreKeeper.add(Icon(
                      Icons.check,
                      color: Colors.green,
                    ));
                  } else {
                    scoreKeeper.add(Icon(
                      Icons.clear,
                      color: Colors.red,
                    ));
                  }
                  num = num + 1;
                });
              },
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
            ),
          ),
        ),
        Row(children: scoreKeeper)
      ],
    );
  }
}
