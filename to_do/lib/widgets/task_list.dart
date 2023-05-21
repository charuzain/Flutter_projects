import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do/widgets/task_tile.dart';

import '../model/task.dart';
import 'list_tile.dart';

class TaskList extends StatefulWidget {

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<Task> taskList = [
    Task(taskName: 'Learn Dart'),
    Task(taskName: 'Learn about widgets'),
    Task(taskName: 'Learn about networking'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: taskList.length ,
      itemBuilder: (context , index){
      return TaskTiles(name: taskList[index].taskName,
      isSelected: taskList[index].isDone, callBackFunc: (val){
        setState(() {
          taskList[index].taskDone();
        });
        },
      );
    },
    );
  }
}


