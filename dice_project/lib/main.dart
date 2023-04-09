import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int dice1 = 1;
  int dice2 = 5;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Dice'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () {
                  setState(() {
                    dice1 = Random().nextInt(6) + 1;
                    dice2 = Random().nextInt(6) + 1 ;
                  });
                },
                child: Image(image: AssetImage('images/dice$dice1.png')),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: (){
                  setState(() {
                    dice1 = Random().nextInt(6) + 1 ;
                    dice2 = Random().nextInt(6) + 1 ;
                  });
                },
                  child: Image(image: AssetImage('images/dice$dice2.png'))),
            )
          ],
        ),
      ),
          backgroundColor: Colors.red,

    ));
  }
}

// class MyApp extends StatelessWidget {
//   var dice1 = 6;
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return MaterialApp(
//         home: Scaffold(
//       appBar: AppBar(
//         title: Text("Dice Project"),
//         centerTitle: true,
//         backgroundColor: Colors.yellow,
//       ),
//       body: Center(
//         child: Row(
//           // crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Expanded(
//               child: TextButton(
//                 onPressed: (){
//                   dice1 = 5;
//                   print(dice1);
//                 },
//                 child: Image(image: AssetImage('images/dice${dice1}.png')),
//
//               ),
//             ),
//             Expanded(
//               child: TextButton(
//                 child: Image(
//                   image: AssetImage('images/dice2.png'),
//                 ),
//                 onPressed: () {
//                   print("s2cond");
//                 },
//
//               ),
//             )
//           ],
// //  OR Can be written as
//           // children: [
//           // Expanded(child: Image.asset('images/dice1.png')),
//           //   Expanded(child: Image.asset('images/dice2.png'))
//         ),
//       ),
//       backgroundColor: Colors.red,
//     ));
//   }
// }
