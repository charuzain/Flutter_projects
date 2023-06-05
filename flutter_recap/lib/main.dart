import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int num = 2;
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
              colors: [Color.fromARGB(199, 227, 161, 6), Colors.yellow],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  height: 100,
                  image: AssetImage('images/dice-$num.png'),
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          num = Random().nextInt(6) + 1;
                        });
                      },
                      child: num == 4
                          ? const Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Text(
                                "You Won!!!!!!!Congratulations",
                                style: TextStyle(fontSize: 42),
                              ),
                            )
                          : const Text("Roll Dice")),
                ),
                // num == 4 ? Text("You Won") : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}


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