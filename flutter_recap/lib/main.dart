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
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Center(
            child: Column(
              children: [
                Container(
                    child: Image(
                  height: 100,
                  image: AssetImage('images/dice-$num.png'),
                  fit: BoxFit.cover,
                )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          num = Random().nextInt(6) + 1;
                        });
                      },
                      child: num == 4
                          ? Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Text(
                                "You Won!!!!!!!Congratulations",
                                style: TextStyle(fontSize: 42),
                              ),
                            )
                          : Text("Roll Dice")),
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
