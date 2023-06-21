import 'package:flutter/material.dart';

class Category {
  Category({
    required this.id,
    required this.title,
    this.color = Colors.red,
  });

  final int id;
  final String title;

  final Color color;
}
