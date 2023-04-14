import 'package:flutter/material.dart';
import 'homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF0A0E21),
          scaffoldBackgroundColor: Color(0xFF353838),
        ),
      // theme: ThemeData.dark().copyWith(
      //   // copy all the properties  of dark them and the properties what we want to change we write here
      //   // scaffoldBackgroundColor: Colors.purple,
      //   colorScheme: ThemeData().colorScheme.copyWith(
      //     // primary: Color(0xFF0A0E22),
      //     primary: Color(0xFF0A0E21),
      //
      //
      //   ),
      //
      //   scaffoldBackgroundColor: Color(0xFF0A0E21),
      //
      //
      //
      //
      // ),
      //   theme: ThemeData(
      //       colorScheme: ColorScheme.fromSwatch(
      //         primarySwatch: Colors.blueGrey,
      //         accentColor: Colors.yellowAccent,
      //       ),
      //       scaffoldBackgroundColor: Colors.black26,
      //       // primaryColor: Colors.red,
      //       // colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.yellow),
      //       // specify the color of the text usied in body
      //       textTheme: TextTheme(bodyLarge: TextStyle(color: Colors.white))),
        home: HomePage());
  }
}

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return (Scaffold(
//       appBar: AppBar(title: Text("BMI Calcualtor")),
//       body: Center(
//         child: Text(
//           "Body",
//           style: Theme.of(context).textTheme.bodyLarge,
//         ),
//       ),
//
//       // or wrap a  widget in Theme widget and change the style
//       floatingActionButton: Theme(
//         data: ThemeData(accentColor: Colors.pink),
//         child: FloatingActionButton(
//           child: Icon(Icons.add),
//           onPressed: () {},
//         ),
//       ),
//     ));
//   }
// }
