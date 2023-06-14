import '../model/expense_data.dart';

final expenseList = [
  ExpenseList(
      category: ExpenseCategory.bill,
      amount: 100.00,
      date: DateTime.now(),
      title: "Electricity bill"),
  ExpenseList(
      category: ExpenseCategory.eating,
      amount: 80,
      date: DateTime.now(),
      title: "Pizza Hut"),
  ExpenseList(
      category: ExpenseCategory.entertainment,
      amount: 50.00,
      date: DateTime.now(),
      title: "Movie"),
  ExpenseList(
      category: ExpenseCategory.travel,
      amount: 3050.00,
      date: DateTime.now(),
      title: "Travel"),
  ExpenseList(
      category: ExpenseCategory.shopping,
      amount: 90.40,
      date: DateTime.now(),
      title: "Internet"),
];
