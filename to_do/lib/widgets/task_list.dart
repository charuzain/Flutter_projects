
import 'package:flutter/cupertino.dart';

import 'list_tile.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        checkBoxTile(
          title: "Task1",
          selected: true,
          onChange: (val) {},
        ),
        checkBoxTile(
          title: "Task2",
          selected: true,
          onChange: (val) {},
        ),
        checkBoxTile(
          title: "Task3",
          selected: true,
          onChange: (val) {},
        ),
      ],
    );
  }
}

