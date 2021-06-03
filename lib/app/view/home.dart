import 'package:flutter/material.dart';

import '../my_app.dart';

class Home extends StatelessWidget {
  const Home({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    List tipos = [
      {Tipos("ToDo")},
      {Tipos("Doing")},
      {Tipos("Done")}
    ];

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          children: [
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(MyApp.TAREFAS);
              },
              child: const Text('To Do'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(MyApp.TAREFAS);
              },
              child: const Text('Doing'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(MyApp.TAREFAS);
              },
              child: const Text('Done'),
            ),
            // for (var tipo in tipos) {Text(tipo['nome'])}
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: ),
        tooltip: 'Adicionar Seção',
        onPressed: () {
          Navigator.of(context).pushNamed(MyApp.SECAOFORM);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class Tipos {
  late String nome;
  Tipos(this.nome);
}
