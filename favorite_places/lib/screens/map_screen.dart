import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../model/places.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key, required this.place});
  final Place place;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.place.address),
      ),
      body: Text("display full mao"),
    );
  }
}
