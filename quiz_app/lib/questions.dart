import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "What is flutter popular for in the programming world ?",
            style: TextStyle(color: Colors.white, fontSize: 32),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(onPressed: () {}, child: Text("Answer 1")),
          ElevatedButton(onPressed: () {}, child: Text("Answer 2")),
          ElevatedButton(onPressed: () {}, child: Text("Answer 3")),
          ElevatedButton(onPressed: () {}, child: Text("Answer 3")),
        ],
      ),
    );
  }
}
