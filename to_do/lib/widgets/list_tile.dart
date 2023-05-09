

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class checkBoxTile extends StatelessWidget {
  checkBoxTile(
      {required this.title, required this.selected, required this.onChange});

  final bool selected;
  final String title;
  dynamic onChange;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      onChanged: onChange,
      title: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
      value: selected,
      controlAffinity: ListTileControlAffinity.platform,
      activeColor: Colors.lightBlueAccent,
      checkColor: Colors.black,
    );
  }
}
