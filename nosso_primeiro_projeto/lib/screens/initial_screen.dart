import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/components/task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);
//não colocamos a opacidade aqui porque não estamos recebendo ela.
  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacidade = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Container(), title: const Text('Tarefas')),
      body: AnimatedOpacity(
        opacity: opacidade ? 1 : 0,
        duration: const Duration(milliseconds: 800),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: const [
            Task(
                'Aprender Flutter',
                'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
                3),
            Task(
                'Andar de Bike',
                'https://images.pexels.com/photos/161172/cycling-bike-trail-sport-161172.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                2),
            Task(
                'Orar',
                'https://files.adventistas.org/noticias/pt/2022/01/10d64508-aa34-44b6-8ca0-56e656d2714b.jpg',
                5),
            Task(
                'Ler a biblia',
                'https://www.miliciadaimaculada.org.br/source/files/c/7011/A_Biblia_Sagrada-249504_1208-800-0-0.jpg',
                4),
            Task(
                'Estudar 1',
                'https://cdn.aprovadoapp.com.br/blog/midia/artigo4-capa.jpg',
                5),
            Task(
                'Ver Youtube',
                'https://img-21.ccm2.net/Xzq57YZf4NBgVTpboohRrfgvWg4=/500x/22db3f0595ee4cb29016a4ef46e57dc1/ccm-faq/123rf_bloomua.jpg',
                1),
            SizedBox(
              height: 80,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacidade = !opacidade;
          });
        },
        child: const Icon(Icons.remove_red_eye),
      ),
    );
  }
}