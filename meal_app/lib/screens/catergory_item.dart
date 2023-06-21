import 'package:flutter/material.dart';

import '../model/category.dart';

class CatergoryItem extends StatelessWidget {
  const CatergoryItem({required this.category, super.key});
  final Category category;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("hi");
      },
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [category.color, category.color.withOpacity(0.9)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: Center(
          child: Text(
            category.title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
