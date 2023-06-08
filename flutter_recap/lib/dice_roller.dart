// stateful widget 
// we dont have build method , but we have createState() method. 
// this method also has override. it doesnot tske any argument but
// it returns a value which is State object , whoch is a generic value type
// in body os this method we have to return 
// _ means class will be private , even if we import this file to another file



import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_recap/win_message.dart';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  int num = 2;
  @override
  Widget build(BuildContext context) {
    return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  width: 100,
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
                              child: WinMessage(text: "You Won!!!!!!!Congratulations",),
                            )
                          : const Text("Roll Dice")),
                ),
                // num == 4 ? Text("You Won") : Container()
              ],
            ),;
  }
}