import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/meal.dart';

class MealDetail extends StatelessWidget {
  const MealDetail({super.key, required this.selectedMeal});
  final Meal selectedMeal;
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(title: Text(selectedMeal.title)),
      body: Image.network(
        selectedMeal.imageUrl,
        
      ),
    ));
  }
}

// class MealDetail extends StatelessWidget {
//   MealDetail({super.key , required this.selectedMeal});

//   final Meal selectedMeal;
//   @override
//   build(BuildContext context) {
//     return (Scaffold(
//       appBar: AppBar(title: Text("MEal Deyail")),
//     ));
//   }
// }
