import 'package:flutter/foundation.dart';
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

class ExpenseSummary {
// total expense
  ExpenseSummary({required this.expenseList, required this.category});
  List<ExpenseList> expenseList;
  ExpenseCategory category;

  double get categoryExpense {
    double categorySum = 0;
    for (final expense in expenseList) {
      if (expense.category == category) {
        categorySum += expense.amount;
      }
    }
    return categorySum;
  }

  double get totalExpense {
    double sum = 0;
    for (final expense in expenseList) {
      sum = sum + expense.amount;
    }
    return sum;
  }
}
