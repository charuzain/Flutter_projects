import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do/widgets/task_tile.dart';

import 'list_tile.dart';

class TaskList extends StatefulWidget {
  const TaskList({
    super.key,
  });

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  // bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TaskTiles(),
        TaskTiles(),
        TaskTiles(),







        // checkBoxTile(
        //   title: "Task1",
        //   selected: isSelected,
        //   onChange: (val) {
        //    setState(() {
        //      isSelected = val;
        //    });
        //
        //   },
        // ),
        // checkBoxTile(
        //   title: "Task2",
        //   selected: isSelected,
        //   onChange: (val) {
        //     setState(() {
        //       isSelected = val;
        //     });
        //
        //   },
        // ),
        // checkBoxTile(
        //   title: "Task3",
        //   selected: isSelected,
        //   onChange: (val) {
        //     setState(() {
        //       isSelected = val;
        //     });
        //
        //   },
        // ),
      ],
    );
  }
}

// class TaskTiles extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//         title: Text("This is a task"),
//         trailing: Checkbox(
//           value: false,
//           onChanged: (bool? value) {},
//         ));
//   }
// }
