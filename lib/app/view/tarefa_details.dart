import 'package:flutter/material.dart';

import '../my_app.dart';

class TarefaDetails extends StatefulWidget {
  const TarefaDetails({ Key? key }) : super(key: key);

  @override
  _TarefaDetailsState createState() => _TarefaDetailsState();
}

class _TarefaDetailsState extends State<TarefaDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tarefa X"),
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
        child: Column(
          children: <Widget>[
            Text("Titulo tarefa X"),
            Text("Descricao tarefa X"),
          ]
        )
       )
      
    );
  }
}