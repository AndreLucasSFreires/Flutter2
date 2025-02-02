import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/data/task_inherited.dart';

class FormScreen extends StatefulWidget {
  final BuildContext taskContext;
  const FormScreen({Key? key, required this.taskContext}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool valueValidator(String? value){
    if (value != null && value.isEmpty){
      return true;
    }
    return false;
  }

  bool difficultyValidator(String? value){
    if (value != null && value.isEmpty) {
      if (int.parse(value) > 5 || int.parse(value) < 1) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Nova Tarefa'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: 650,
              width: 355,
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 3)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      //Possui um validator.
                      validator: (String? value) {
                        if (valueValidator(value)) {
                          return 'Please, insira o nome da tarefa';
                        }
                        return null;
                      },
                      controller: nameController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Nome',
                          fillColor: Colors.white70,
                          filled: true),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      //Possui um validator.
                      validator: (value) {
                        if (difficultyValidator(value)) {
                          return 'Insira uma dificuldade entre um (1) e cinco (5)';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      controller: difficultyController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Dificuldade',
                          fillColor: Colors.white70,
                          filled: true),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      //Possui um validator.
                      validator: (value) {
                        if (valueValidator(value)) {
                          return 'Insira uma url de imagem';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.url,
                      onChanged: (text) {
                        setState(() {});
                      },
                      controller: imageController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'url de Imagem',
                          fillColor: Colors.white70,
                          filled: true),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 72,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 2,
                        color: Colors.blue,
                      ),
                    ),
                    child: ClipRRect(
                      //child do container.
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        imageController.text,
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return Image.asset('assets/images/noPhoto.png');
                        },
                        fit: BoxFit.cover, //espaçamento
                      ), //child do ClipRRect
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // print(nameController.text);
                        // print(int.parse(difficultyController.text));
                        // print(imageController.text);
                        TaskInherited.of(widget.taskContext).newTask(nameController.text,
                            imageController.text, int.parse(difficultyController
                                .text))
                      ;
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(
                      content: Text('Criando uma nova tarefa'),
                      ));
                      Navigator.pop(context);
                    }
                    },
                    child: Text('Adicionar'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
