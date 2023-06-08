import 'package:flutter/material.dart';

import 'home_screen.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar:
          AppBar(title: const Text("Quiz App"), backgroundColor: Colors.black,
          ),
      body: const HomeScreen(),
      
    ),
  ));
}
