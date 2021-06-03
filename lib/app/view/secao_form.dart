import 'package:flutter/material.dart';

class SecaoForm extends StatelessWidget {
  const SecaoForm({Key? key}) : super(key: key);

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
            Text('label("Cor")'),
            Text('input("Cor")'),
            Text('Button Salvar')
          ],
        )
      )
    );
  }
}
