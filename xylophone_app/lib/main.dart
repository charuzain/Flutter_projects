import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Expanded buildApp(Color color , int num) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.red,
          backgroundColor: color
        ),
        onPressed: () {
          final player = AudioPlayer();
          player.play(
            AssetSource('note$num.wav'),
          );
        },
        child: Text(""),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("xylophone"),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildApp(Colors.red , 1),
            buildApp(Colors.yellow , 2),
            buildApp(Colors.green  , 3),
            buildApp(Colors.orange , 4),
            buildApp(Colors.blue  , 5),
            buildApp(Colors.indigo , 6),
            buildApp(Colors.deepPurple , 7),

          ],
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}
