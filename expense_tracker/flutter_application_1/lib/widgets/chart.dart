import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/expense.dart';

import '../model/expense_data.dart';

class Chart extends StatelessWidget {
  Chart({required this.expenseList, super.key});
  final List<ExpenseList> expenseList;

  List<ExpenseSummary> get buckets {
    return [
      ExpenseSummary(expenseList: expenseList, category: ExpenseCategory.bill),
      ExpenseSummary(
          expenseList: expenseList, category: ExpenseCategory.eating),
      ExpenseSummary(
          expenseList: expenseList, category: ExpenseCategory.entertainment),
      ExpenseSummary(
          expenseList: expenseList, category: ExpenseCategory.shopping),
      ExpenseSummary(
          expenseList: expenseList, category: ExpenseCategory.travel),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Color.fromARGB(111, 250, 111, 110),
          height: 180,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    for (final bucket in buckets)
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: FractionallySizedBox(
                            heightFactor:
                                bucket.categoryExpense / bucket.totalExpense,
                            child: const DecoratedBox(
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 123, 99, 90),
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(12)))),
                            // heightFactor: bucket.categoryExpense / bucket.totalExpense,
                          ),
                        ),
                      )
                  ],
                ),
              ),
              Divider(),
              SizedBox(
                height: 2,
              ),
              Row(
                children: [
                  ...buckets
                      .map((item) =>
                          Expanded(child: Icon(categoryIcon[item.category])))
                      .toList()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
