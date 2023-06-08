import 'package:flutter/material.dart';
import 'dice_roller.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // backgroundColor: const Color.fromARGB(118, 62, 9, 196),
        body: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            color: Color.fromARGB(
                200, 111, 20, 222), // ignored if gradient is not null
            border: Border.fromBorderSide(BorderSide(color: Colors.red)),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xB7564664), Colors.yellow],
            ),
          ),
          child: const Center(
            child:DiceRoller()
          ),
        ),
      ),
    );
  }
}

// It is considered as a good practice to keep the custom widget in a separate file


// const is a keyword which optimize runtime performance of the app.
// When a widget lets say text widget is defined with a text hello in the app that widget
// is stored int he internal memeory of the device on whoch the app is running. And when that text widget with the same message is used for the second time the app use tjhe existing memory is reused instead of new memory object being created
//so it avoid duplictaion of data in memeory

// Root widget for setting overall app -> MaterialApp
// Scaffold-> must be inside materialApp , set up good looking screen

// ? either value is there or null
// all widgets are objects and are saved as objects
// Conatiner: very useful for styling and layout . doestnot supoort setting it to const neither the parent can be const.
// with background color we cant achieve gradient.
