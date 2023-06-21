import 'package:flutter/material.dart';
import 'package:meal_app/screens/category.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData().copyWith(
      //   colorScheme: ColorScheme.fromSeed(
      //       seedColor: Colors.orange, brightness: Brightness.dark),
      //   textTheme: GoogleFonts.latoTextTheme(),
      // ),
      theme: ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
),
      home: Category(),
      debugShowCheckedModeBanner: false,
    );
  }
}
