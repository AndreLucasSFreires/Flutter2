import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/components/task.dart';
import 'package:nosso_primeiro_projeto/data/task_inherited.dart';
import 'package:nosso_primeiro_projeto/screens/form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

//não colocamos a opacidade aqui porque não estamos recebendo ela.
  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Container(), title: const Text('Tarefas')),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: TaskInherited.of(context).taskList,
        //aqui é onde você encontra esse metodo, que pede um contexto e retorna esse objeto
        padding: EdgeInsets.only(
          top: 20,
          bottom: 80,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (contextNew) => FormScreen(taskContext: context),
              ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
