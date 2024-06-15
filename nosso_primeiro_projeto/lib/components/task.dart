import 'package:flutter/material.dart';

import 'difficulty.dart';

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
                          Difficulty(dificultyLevel: widget.dificuldade,)
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