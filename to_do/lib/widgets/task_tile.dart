

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskTiles extends StatefulWidget {


  @override
  State<TaskTiles> createState() => _TaskTilesState();
}

class _TaskTilesState extends State<TaskTiles> {
  bool isSelected = false;
 VoidCallback ? changeState (bool ? value ){
    setState(() {
      isSelected = value!;
    }  );

  }
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text("This is a task" , style: TextStyle(
          decoration:isSelected? TextDecoration.lineThrough :  null
        ),),
        trailing: NewCheckBox(isSelected: isSelected , fun: changeState));
  }
}

class NewCheckBox extends StatelessWidget {
   NewCheckBox({

    required this.isSelected, required this.fun
  });

  final bool isSelected;
Function(bool ?) fun;

  @override
  Widget build(BuildContext context) {
    print("widget");
    return Checkbox(
      value: isSelected,
      onChanged: fun
        );
      }

  }
