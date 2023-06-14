import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

enum ExpenseCategory { travel, shopping, eating, entertainment, bill }

const categoryIcon = {
  ExpenseCategory.travel: Icons.airplane_ticket,
  ExpenseCategory.shopping: Icons.shopping_bag,
  ExpenseCategory.eating: Icons.restaurant,
  ExpenseCategory.entertainment: Icons.movie,
  ExpenseCategory.bill: Icons.receipt
};

class ExpenseList {
  ExpenseList(
      {required this.title,
      required this.date,
      required this.amount,
      required this.category});
  String title;
  DateTime date;
  double amount;
  ExpenseCategory category;

  
}
