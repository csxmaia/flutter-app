import 'package:flutter/material.dart';

import '../my_app.dart';

class Tarefas extends StatefulWidget {
  const Tarefas({Key? key}) : super(key: key);

  @override
  _TarefasState createState() => _TarefasState();
}

class _TarefasState extends State<Tarefas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Tarefas da seção X"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(MyApp.TAREFAFORM);
            }
          )
        ],
      ),
      body: Center(
        child: Column(children: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(MyApp.TAREFADETAILS, arguments: 1);
            },
            child: const Text('Tarefa 1'),
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(MyApp.TAREFADETAILS, arguments: 2);
            },
            child: const Text('Tarefa 2'),
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(MyApp.TAREFADETAILS, arguments: 3);
            },
            child: const Text('Tarefa 3'),
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(MyApp.TAREFADETAILS, arguments: 4);
            },
            child: const Text('Tarefa 4'),
          ),
        ]
      )),
    );
  }
}
