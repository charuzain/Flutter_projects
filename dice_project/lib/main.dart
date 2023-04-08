import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return MaterialApp(
     home:Scaffold(
       appBar: AppBar(title: Text("Dice Project"),),
       body: Image(image: AssetImage('images/dice1.png')),
       backgroundColor: Colors.red,
     )
   );
  }

}