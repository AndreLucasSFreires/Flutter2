import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<Task> taskList = [
    Task('Aprender Flutter', 'assets/images/dash.png', 3),
    Task('Andar de Bike', 'assets/images/bike.jpeg', 2),
    Task('Orar', 'assets/images/oracao.jpg', 5),
    Task('Ler a biblia', 'assets/images/ler_a_biblia.jpg', 4),
    Task('Estudar 1', 'assets/images/estudar1.jpg', 5),
    Task('Ver Youtube', 'assets/images/verYoutube.webp', 1),
  ];

  void newTask(String name, String photo, int difficulty){
    taskList.add(Task(name, photo, difficulty));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited old) {
    return;
  }
}
