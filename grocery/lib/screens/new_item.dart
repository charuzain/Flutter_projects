import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:grocery/model/grocery_item.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

// enum Category { dairy, meat, vegetable, fruit, carbs, sweets, spices, other }

class NewGroceryItem extends StatefulWidget {
  const NewGroceryItem({super.key});

  @override
  State<NewGroceryItem> createState() => _NewGroceryItemState();
}

class _NewGroceryItemState extends State<NewGroceryItem> {
  final _formKey = GlobalKey<FormState>();
  String initialTitle = '';
  String initialQuantity = '1';
  GroceryCategory selectedCategory = GroceryCategory.vegetable;
  bool isSaving = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Grocery Item"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: initialTitle,
                maxLength: 50,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  hintText: "Enter the name of grocery item",
                  label: Text("Name"),
                  // border: UnderlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty || value.trim().isEmpty) {
                    return "Enter some value";
                  }
                  if (value.length > 50) {
                    return "Total character should be less than 50";
                  }
                  return null;
                },
                onChanged: (value) {
                  initialTitle = value;
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: initialQuantity,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: "Quantity"),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.trim().isEmpty ||
                            int.tryParse(value) == null) {
                          return "Enter some value / Enter a valid input";
                        }
                        if (int.tryParse(value)! < 0) {
                          return "Quanitity should be a positive number";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        initialQuantity = value;
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: DropdownButtonFormField(
                        value: selectedCategory,
                        items: [
                          for (final category in GroceryCategory.values)
                            DropdownMenuItem(
                                value: category, child: Text(category.name))
                        ],
                        onChanged: (val) {
                          setState(() {
                            selectedCategory = val!;
                          });

                          // selectedCategory = val;
                        }),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        _formKey.currentState!.reset();
                      },
                      child: Text("Reset")),
                  const SizedBox(
                    width: 15,
                  ),
                  ElevatedButton(
                      onPressed: isSaving
                          ? null
                          : () async {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();

// diable save button
                                setState(() {
                                  isSaving = true;
                                });

                                final url = Uri.https(
                                    'flutter-1d4a5-default-rtdb.firebaseio.com',
                                    "list.json");
                                final response = await http.post(url,
                                    body: json.encode({
                                      'title': initialTitle,
                                      'quantity': initialQuantity,
                                      'category': selectedCategory.name,
                                    }));

                                // print(response);
                                // print(json.decode(response.body));
                                // print(response.statusCode);
// if widget
                                if (!context.mounted) {
                                  return;
                                }
                                Navigator.pop(context, {
                                  'id': json
                                      .decode(response.body)['name']
                                      .toString(),
                                  'title': initialTitle,
                                  'quantity': initialQuantity,
                                  'category': selectedCategory,
                                });
                              }
                            },
                      child: isSaving
                          ? Center(child: CircularProgressIndicator())
                          : Text("Save"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
