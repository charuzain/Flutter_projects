import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskTiles extends StatelessWidget {
  bool isSelected;

  String name;

  var callBackFunc;
  var longPressCallBack;

  TaskTiles({required this.name , required this.isSelected, required this.callBackFunc , required this.longPressCallBack});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallBack,
        title: Text(
          name,
          style: TextStyle(
              decoration:isSelected? TextDecoration.lineThrough :  null
              ),
        ),
        trailing: Checkbox(
            value: isSelected,
            onChanged: callBackFunc
            ));
  }
}
