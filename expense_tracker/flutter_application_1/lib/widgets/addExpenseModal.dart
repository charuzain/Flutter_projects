import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';

import '../model/expense_data.dart';

class AddExpenseModal extends StatefulWidget {
  const AddExpenseModal({super.key});

  @override
  State<AddExpenseModal> createState() => _AddExpenseModalState();
}

class _AddExpenseModalState extends State<AddExpenseModal> {
  // String expenseTitle = "";
  final titleController = TextEditingController();
  final amountCotroller = TextEditingController();
  DateTime? choosenDate;
  ExpenseCategory selectedVal = ExpenseCategory.bill;

  @override
  void dispose() {
    // destroy titleController when modal is closed as its no longer needed , will save memory
    titleController.dispose();
    amountCotroller.dispose();
    super.dispose();
  }

  void presentDatePicker() async {
    DateTime now = DateTime.now();

    final selectedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: DateTime(now.year - 1),
        lastDate: now);

    setState(() {
      choosenDate = selectedDate;
    });
  }

  void addExpense() {
// first do validation
// check inputs are there
// Amount : amount should be greater than 0 and it should be integer
    bool isAmountValid = double.tryParse(amountCotroller.text) == null ||
        amountCotroller.text.isEmpty;

    if (titleController.text.trim().isEmpty || isAmountValid) {
      // show error

      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text("Invalid Data"),
                content: const Text(
                    "Enter a valid Input ! Make sure the fields are not empty !"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                    },
                    child: const Text("Close"),
                  )
                ],
              ));
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        children: [
          TextField(
            // onChanged: (value) => {expenseTitle = value},
            controller: titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text("Title"),
            ),
            keyboardType: TextInputType.text,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: TextField(
                  controller: amountCotroller,
                  decoration: const InputDecoration(
                    label: Text("Expense"),
                    prefix: Text('\$ '),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(
                width: 40,
              ),
              Row(
                children: [
                  Text(choosenDate == null
                      ? "No Date selected"
                      : DateFormat.yMd().format(choosenDate!)),
                  IconButton(
                    onPressed: presentDatePicker,
                    icon: const Icon(Icons.calendar_month),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: addExpense,
                child: const Text("Add Expense"),
              ),
              const SizedBox(
                width: 25,
              ),
              ElevatedButton(onPressed: () {}, child: Text("Reset")),
              const Spacer(),
              DropdownButton(
                  value: selectedVal,
                  items: ExpenseCategory.values
                      .map((item) => DropdownMenuItem(
                            value: item,
                            child: Text(item.name),
                          ))
                      .toList(),
                  onChanged: (val) {
                    if (val != null) {
                      setState(() {
                        selectedVal = val;
                      });
                    }
                  })
            ],
          ),
        ],
      ),
    );
  }
}
