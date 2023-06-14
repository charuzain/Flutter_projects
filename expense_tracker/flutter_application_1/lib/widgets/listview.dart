import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../model/expense_data.dart';

class ExpenseListView extends StatelessWidget {
  const ExpenseListView({required this.expenseList, super.key});

  final List<ExpenseList> expenseList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenseList.length,
        itemBuilder: (context, index) => Card(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(expenseList[index].amount.toString()),
                    Column(
                      children: [
                        Text(expenseList[index].title),
                        Row(
                          children: [
                            Icon(
                              categoryIcon[expenseList[index].category],
                              color: Colors.amber,
                            ),
                            Text(expenseList[index].date.toString())
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ));
  }
}
