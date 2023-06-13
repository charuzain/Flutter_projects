import 'package:flutter/material.dart';

class Expense extends StatefulWidget {
  const Expense({super.key});

  @override
  State<Expense> createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Expense Tracker"),
        backgroundColor: const Color.fromARGB(255, 69, 13, 89),
      ),
      body: Column(
        children: const [
          Text("Chart"),
          Text("Expense List...."),
          Text("Expense List......!!!!")
        ],
      ),
    );
  }
}
