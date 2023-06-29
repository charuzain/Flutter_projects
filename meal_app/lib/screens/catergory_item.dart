import 'package:flutter/material.dart';
import '../model/category.dart';

class CatergoryItem extends StatefulWidget {
  const CatergoryItem(
      {required this.category, required this.selectCategory, super.key});
  final Category category;
  final Function() selectCategory;

  @override
  State<CatergoryItem> createState() => _CatergoryItemState();
}

class _CatergoryItemState extends State<CatergoryItem>
// step 3 extends using with SingleTickerProviderStateMixin
    with
        SingleTickerProviderStateMixin {
  // step 1 : declare a variable
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    // step 2 initialize the animation controller
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
      lowerBound: 0,
      upperBound: 1,
    );

    // step 6 start the animation
    animationController.forward();
  }

  // step 4 dispose it

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // step 5 wrap inside animatebuilder
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) => Padding(
        padding: EdgeInsets.only(top: 100 - 100 * animationController.value),
        child: child,
      ),
      child: InkWell(
        onTap: widget.selectCategory,
        splashColor: Theme.of(context).primaryColor,
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                widget.category.color,
                widget.category.color.withOpacity(0.9)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(16)),
          child: Center(
            child: Text(
              widget.category.title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.background),
            ),
          ),
        ),
      ),
    );
  }
}
