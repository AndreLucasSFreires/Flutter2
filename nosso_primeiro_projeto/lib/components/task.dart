import 'package:flutter/material.dart';
import 'difficulty.dart';

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;

  Task(this.nome, this.foto, this.dificuldade, {Key? key})
      : super(key: key);

  int nivel = 0;//alteramos de lugar essa variavel para não ser remontado.

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  bool assetOrNetwork() {
    if (widget.foto.contains('http')) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
                            child: assetOrNetwork()
                                ? Image.asset(widget.foto, fit: BoxFit.cover)
                                : Image.network(widget.foto,
                                    fit: BoxFit.cover))),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 200,
                            child: Text(
                              widget.nome,
                              style: const TextStyle(
                                  fontSize: 24,
                                  overflow: TextOverflow.ellipsis),
                            )),
                        Difficulty(
                          dificultyLevel: widget.dificuldade,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                widget.nivel++;
                              });
                              //print(nivel);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
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
                                widget.nivel--;
                              });
                              //print(nivel);
                            },
                            child: Column(
                              children: const [
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
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        color: Colors.white,
                        value: (widget.dificuldade > 0)
                            ? (widget.nivel / widget.dificuldade) / 10
                            : 1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Nivel ${widget.nivel}',
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  SizedBox(
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
                            widget.nivel = 0;
                          });
                        },
                        child: const Text(
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
    );
  }
}
