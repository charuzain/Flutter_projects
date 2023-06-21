import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Meals Category")),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1.5),
        children: const [
          Text("Italian"),
          Text("Indian"),
          Text("breakfast"),
          Text("Quick and Easy"),
          Text("Soup"),
          Text("Bread"),
          Text("Rice"),
          Text("Salad"),
          Text("Dessert"),

        
        ],
      ),
    );
  }
}
