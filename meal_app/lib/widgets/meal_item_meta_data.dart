import 'package:flutter/material.dart';

import '../model/meal.dart';

class MealItemMetaData extends StatelessWidget {
  const MealItemMetaData({super.key, required this.title, required this.icon});

  final String title;

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(icon),
      const SizedBox(
        width: 4,
      ),
      Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
      ),
    ]);
  }
}
