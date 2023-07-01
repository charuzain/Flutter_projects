import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:grocery/model/grocery_item.dart';

// enum Category { dairy, meat, vegetable, fruit, carbs, sweets, spices, other }

class NewGroceryItem extends StatefulWidget {
  const NewGroceryItem({super.key});

  @override
  State<NewGroceryItem> createState() => _NewGroceryItemState();
}

class _NewGroceryItemState extends State<NewGroceryItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Grocery Item"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Enter the name of grocery item",
                  label: Text("Name"),
                  // border: UnderlineInputBorder(),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: "1",
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: "Quantity"),
                    ),
                  ),
                  Expanded(
                    child: DropdownButtonFormField(items: [
                      for (final category in GroceryCategory.values)
                        DropdownMenuItem(
                            value: category.name, child: Text(category.name))
                    ], onChanged: (val) {}),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
