import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      // theme: ThemeData.dark(),
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.blueGrey,
              accentColor: Colors.red,
            ),
            scaffoldBackgroundColor: Colors.black26,
            // primaryColor: Colors.yellowAccent,
            // colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.yellow),
            // specify the color of the text usied in body
            textTheme: TextTheme(bodyLarge: TextStyle(color: Colors.white))),
        home: HomePage());
  }
}

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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    ));
  }
}
