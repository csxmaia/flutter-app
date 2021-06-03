import 'package:flutter/material.dart';

class TarefaForm extends StatelessWidget {
  const TarefaForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Seção')
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('label("Nome")'),
            Text('input("Nome")'),
            Text('label("Descricao")'),
            Text('input("Descricao")'),
            Text('label("Comentarios")'),
            Text('input("Comentarios")'),
            Text('Button Salvar')
          ],
        )
      )
    );
  }
}
