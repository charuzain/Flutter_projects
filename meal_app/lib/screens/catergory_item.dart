import 'package:flutter/material.dart';
import '../model/category.dart';


class CatergoryItem extends StatelessWidget {
  const CatergoryItem({required this.category, required this.selectCategory, super.key});
  final Category category;
  final Function() selectCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectCategory,
    
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [category.color, category.color.withOpacity(0.9)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(16)),
        child: Center(
          child: Text(
            category.title,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.background),
          ),
        ),
      ),
    );
  }
}
