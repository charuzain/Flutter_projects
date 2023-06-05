import 'package:flutter/material.dart';

class WinMessage extends StatelessWidget {
// Constructor for public widget required named parameter key , which is then passed to StatelessWidget class.{required key} is named parameter , which is passed to statelessWidget class when its constructor is invoked using super 
  // const WinMessage({key}) : super(key: key); 
  // It can also be written as 
  const WinMessage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Text(
      "You Won!!!!!!!Congratulations",
      style: TextStyle(
          fontSize: 42,
          color: Colors.white,
          letterSpacing: 10,
          backgroundColor: Color.fromARGB(100, 209, 123, 80)),
    );
  }
}