import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return MaterialApp(
     theme: ThemeData(scaffoldBackgroundColor: Color(0xFF273746),
       colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.red),
       textTheme: TextTheme(
         bodyLarge: TextStyle(color: Colors.white)
       )
     ),
     home:HomePage()
   );
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
    return (
    Scaffold(
      appBar: AppBar(title: Text("BMI Calcualtor")),
      body: Center(
        child: Text("Body", style: Theme.of(context).textTheme.bodyLarge,),
      ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add), onPressed: () {  },),
    )
    );
  }
}
