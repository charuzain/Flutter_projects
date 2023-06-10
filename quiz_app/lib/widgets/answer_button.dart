import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({required this.onClick, required this.option, super.key});
  final String option;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClick,
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          backgroundColor: const Color.fromARGB(255, 50, 7, 59),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0))),
      child: Text(
        option,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
