import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        home: Scaffold(
          appBar: AppBar(leading: Container(), title: Text('Tarefas')),
          body: ListView(
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
          floatingActionButton: FloatingActionButton(onPressed: () {}),
        ));
  }
}

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;

  const Task(this.nome, this.foto, this.dificuldade, {Key? key})
      : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.blue,
              ),
              height: 140,
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.black26,
                          ),
                          width: 72,
                          height: 100,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image.network(widget.foto,
                                  fit: BoxFit.cover))),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: 200,
                              child: Text(
                                widget.nome,
                                style: TextStyle(
                                    fontSize: 24,
                                    overflow: TextOverflow.ellipsis),
                              )),
                          Row(
                            children: [
                              Icon(Icons.star,
                                  size: 15,
                                  color: (widget.dificuldade) >= 1
                                      ? Colors.blue
                                      : Colors.blue[100]),
                              Icon(Icons.star,
                                  size: 15,
                                  color: (widget.dificuldade) >= 2
                                      ? Colors.blue
                                      : Colors.blue[100]),
                              Icon(Icons.star,
                                  size: 15,
                                  color: (widget.dificuldade) >= 3
                                      ? Colors.blue
                                      : Colors.blue[100]),
                              Icon(Icons.star,
                                  size: 15,
                                  color: (widget.dificuldade) >= 4
                                      ? Colors.blue
                                      : Colors.blue[100]),
                              Icon(Icons.star,
                                  size: 15,
                                  color: (widget.dificuldade) >= 5
                                      ? Colors.blue
                                      : Colors.blue[100])
                            ],
                          )
                        ],
                      ),
                      Column(
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  nivel++;
                                });
                                print(nivel);
                              },
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.arrow_drop_up),
                                  Text(
                                    'aumentar',
                                    style: TextStyle(fontSize: 10),
                                  )
                                ],
                              )),
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  nivel--;
                                });
                                print(nivel);
                              },
                              child: Column(
                                children: [
                                  Icon(Icons.arrow_drop_down),
                                  Text(
                                    'diminuir',
                                    style: TextStyle(fontSize: 10),
                                  )
                                ],
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          value: (widget.dificuldade > 0)
                              ? (nivel / widget.dificuldade) / 10
                              : 1,
                        ),
                        width: 200,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Nivel $nivel',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    Container(
                      width: 60,
                      child: ElevatedButton(
                          style: ButtonStyle(backgroundColor:
                              MaterialStateProperty.resolveWith((states) {
                            if (states.contains(MaterialState.pressed)) {
                              return Colors.green;
                            }
                            return Colors.red;
                          })),
                          onPressed: () {
                            setState(() {
                              nivel = 0;
                            });
                          },
                          child: Text(
                            'Zerar',
                            style: TextStyle(fontSize: 10),
                          )),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
