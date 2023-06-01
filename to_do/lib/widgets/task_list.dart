import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/widgets/task_tile.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../model/task.dart';
import 'list_tile.dart';

class TaskList extends StatefulWidget {
  // final List<Task> taskList;
  //
  // TaskList({required this.taskList});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(
      builder: (BuildContext context, value, Widget? child) =>
       ListView.builder(
        itemCount: value.sizeTaskList(),
        itemBuilder: (context , index){
        return TaskTiles(name: value.taskList[index].taskName,
        isSelected: value.taskList[index].isDone, callBackFunc: (val){
          // setState(() {
          //   widget.taskList[index].taskDone();
          // });
          },
        );
      },
      ),
    );
  }
}


