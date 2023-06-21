import 'package:flutter/material.dart';
import 'package:meal_app/screens/category.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Category(),
      debugShowCheckedModeBanner: false,
    );
  }
}
