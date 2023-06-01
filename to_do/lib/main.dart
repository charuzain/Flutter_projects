import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';
import 'model/task.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>DataProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}


class DataProvider extends ChangeNotifier{

  List<Task> taskList = [
    Task(taskName: 'Learn Dart'),
    Task(taskName: 'Learn about widgets'),
    Task(taskName: 'Learn about networking'),
  ];

  void addTask(Task value){
    taskList.add(value);
    notifyListeners();
  }

  int sizeTaskList(){
    return taskList.length;
  }

  void deleteTask(Task task){
    taskList.remove(task);
    notifyListeners();
  }

  void taskUpdate(Task task){
    task.taskDone();
    notifyListeners();


  }

}


