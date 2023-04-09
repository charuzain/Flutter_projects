import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Dice Project"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: TextButton(
                child: Image(image: AssetImage('images/dice1.png')),
                onPressed: (){
                  print("dice1");
                },
              ),
            ),
            Expanded(
              child: TextButton(
                child: Image(
                  image: AssetImage('images/dice2.png'),
                ),
                onPressed: () {
                  print("s2cond");
                },

              ),
            )
          ],
//  OR Can be written as
          // children: [
          // Expanded(child: Image.asset('images/dice1.png')),
          //   Expanded(child: Image.asset('images/dice2.png'))
        ),
      ),
      backgroundColor: Colors.red,
    ));
  }
}
