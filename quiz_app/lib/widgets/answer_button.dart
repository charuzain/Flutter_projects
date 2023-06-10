import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({required this.question, super.key});
  final String question;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 50, 7, 59),
           shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)))),
      child: Text(
        question,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
