import 'dart:ui';

import 'package:flutter/material.dart';

enum GroceryCategory { dairy, meat, vegetable, fruit, carbs, sweets, spices, other }

class GroceryItem {
  GroceryItem(this.id, this.title, this.quantity, this.category){
    setColor(category);
  }
  final String id;
  final String title;
  final int quantity;
  final GroceryCategory category;
  
  late Color color;


  void setColor(GroceryCategory category){
    switch (category) {
      case GroceryCategory.dairy:
        color = Colors.blue;
        break;
      case GroceryCategory.meat:
        color = Colors.red;
        break;
      case GroceryCategory.vegetable:
        color = Colors.green;
        break;
      case GroceryCategory.fruit:
        color = Colors.orange;
        break;
      case GroceryCategory.carbs:
        color = Colors.yellow;
        break;
      case GroceryCategory.sweets:
        color = Colors.purple;
        break;
      case GroceryCategory.spices:
        color = Colors.brown;
        break;
      case GroceryCategory.other:
        color = Colors.grey;
        break;
    }

  }
}


