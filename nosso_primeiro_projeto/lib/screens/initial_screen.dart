import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/components/task.dart';
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
        children: const [
          Task('Aprender Flutter', 'assets/images/dash.png', 3),
          Task('Andar de Bike', 'assets/images/bike.jpeg', 2),
          Task('Orar', 'assets/images/oracao.jpg', 5),
          Task('Ler a biblia', 'assets/images/ler_a_biblia.jpg', 4),
          Task('Estudar 1', 'assets/images/estudar1.jpg', 5),
          Task('Ver Youtube', 'assets/images/verYoutube.webp', 1),
          SizedBox(
            height: 80,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FormScreen(),
              ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
