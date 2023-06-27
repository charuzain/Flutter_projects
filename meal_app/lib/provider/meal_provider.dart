import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/data/categoryList.dart';

final mealProvider = Provider((ref) {
  return dummyMeals;
});
