import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/expense_list.dart';
import 'package:flutter_application_1/model/expense_data.dart';
import 'package:flutter_application_1/widgets/addExpenseModal.dart';
import 'package:flutter_application_1/widgets/listview.dart';

class Expense extends StatefulWidget {
  const Expense({super.key});

  @override
  State<Expense> createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  void displayList(ExpenseList newExpense) {
    setState(() {
      expenseList.add(newExpense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Expense Tracker"),
        backgroundColor: const Color.fromARGB(255, 69, 13, 89),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                  // when isScrollControlled is true modal pverlay will take full height
                    isScrollControlled: true,
                    context: context,
                    builder: (ctx) =>
                        AddExpenseModal(displayList: displayList));
              },
              icon: const Icon(Icons.add))
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 20),
          //   child: Icon(Icons.add),
          // )
        ],
      ),
      body: Column(
        children: [
          const Text("Chart"),
          Expanded(child: ExpenseListView(expenseList: expenseList)),
        ],
      ),
    );
  }
}
