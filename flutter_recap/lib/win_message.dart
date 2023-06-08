import 'package:flutter/material.dart';

class WinMessage extends StatelessWidget {
  final String text;
// Constructor for public widget required named parameter key , which is then passed to StatelessWidget class.{required key} is named parameter , which is passed to statelessWidget class when its constructor is invoked using super
  // const WinMessage({key}) : super(key: key);
  // It can also be written as
  const WinMessage({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 42,
          color: Colors.white,
          letterSpacing: 10,
          backgroundColor: Color.fromARGB(100, 209, 123, 80)),
    );
  }
}

// locked in at the point code is compiled in case of const
// calling an fun => executed when an app run , its not complie time constant , value is not know at the point of time when it is complied , it is known when code is executed
// complie time
