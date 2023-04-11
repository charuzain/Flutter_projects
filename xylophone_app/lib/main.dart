import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

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
            title: Text("xylophone"),
            centerTitle: true,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              Expanded(
                child: TextButton(
          style: TextButton.styleFrom(
                foregroundColor: Colors.red,
            backgroundColor: Colors.yellow,
          ),

                  onPressed: () {
                    final player = AudioPlayer();
                    player.play(
                      AssetSource('note1.wav'),
                    );
                  },
                  child: Text(""),

                ),
              ),

              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.red,
                    backgroundColor: Colors.red,
                  ),

                  onPressed: () {
                    final player = AudioPlayer();
                    player.play(
                      AssetSource('note2.wav'),
                    );
                  },
                  child: Text(""),

                ),
              ),

              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.red,
                    backgroundColor: Colors.green,
                  ),

                  onPressed: () {
                    final player = AudioPlayer();
                    player.play(
                      AssetSource('note3.wav'),
                    );
                  },
                  child: Text(""),

                ),
              ),

              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.red,
                    backgroundColor: Colors.orange,
                  ),

                  onPressed: () {
                    final player = AudioPlayer();
                    player.play(
                      AssetSource('note4.wav'),
                    );
                  },
                  child: Text(""),

                ),
              ),

              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.red,
                    backgroundColor: Colors.blue,
                  ),

                  onPressed: () {
                    final player = AudioPlayer();
                    player.play(
                      AssetSource('note5.wav'),
                    );
                  },
                  child: Text(""),

                ),
              ),

              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.red,
                    backgroundColor: Colors.pink,
                  ),

                  onPressed: () {
                    final player = AudioPlayer();
                    player.play(
                      AssetSource('note6.wav'),
                    );
                  },
                  child: Text(""),

                ),
              ),

              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.red,
                    backgroundColor: Colors.indigo,
                  ),

                  onPressed: () {
                    final player = AudioPlayer();
                    player.play(
                      AssetSource('note7.wav'),
                    );
                  },
                  child: Text(""),

                ),
              ),
            ],
          ),
      backgroundColor: Colors.black,),

    );
  }
}
