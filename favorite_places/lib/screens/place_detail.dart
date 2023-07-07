import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../model/places.dart';

class PlaceDetail extends StatefulWidget {
  const PlaceDetail({super.key, required this.place});
  final Place place;

  @override
  State<PlaceDetail> createState() => _PlaceDetailState();
}

class _PlaceDetailState extends State<PlaceDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text(widget.place.name))),
      body: Center(
        child: Text(
          widget.place.name,
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(color: Colors.white, fontSize: 22),
        ),
      ),
    );
  }
}
