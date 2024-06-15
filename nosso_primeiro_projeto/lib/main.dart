import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nosso_primeiro_projeto/task.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: InitialScreen());
  }
}

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
      appBar: AppBar(leading: Container(), title: Text('Tarefas')),
      body: AnimatedOpacity(
        opacity: opacidade ? 1 : 0,
        duration: Duration(milliseconds: 800),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacidade = !opacidade;
          });
        },
        child: Icon(Icons.remove_red_eye),
      ),
    );
  }
}





