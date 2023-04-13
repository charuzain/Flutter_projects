import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(title: Text("BMI Calcualtor")),
      body: Center(
        child: Text(
          "Body",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),

      // or wrap a  widget in Theme widget and change the style
      floatingActionButton: Theme(
        data: ThemeData(accentColor: Colors.pink),
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ),
      ),
    ));
  }
}