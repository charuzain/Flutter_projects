import 'dart:ui';

import 'package:flutter/material.dart';

enum Category { dairy, meat, vegetable, fruit, carbs, sweets, spices, other }

class GroceryItem {
  GroceryItem(this.id, this.title, this.quantity, this.category){
    setColor(category);
  }
  final String id;
  final String title;
  final int quantity;
  final Category category;
  
  late Color color;


  void setColor(Category category){
    switch (category) {
      case Category.dairy:
        color = Colors.blue;
        break;
      case Category.meat:
        color = Colors.red;
        break;
      case Category.vegetable:
        color = Colors.green;
        break;
      case Category.fruit:
        color = Colors.orange;
        break;
      case Category.carbs:
        color = Colors.yellow;
        break;
      case Category.sweets:
        color = Colors.purple;
        break;
      case Category.spices:
        color = Colors.brown;
        break;
      case Category.other:
        color = Colors.grey;
        break;
    }

  }
}


