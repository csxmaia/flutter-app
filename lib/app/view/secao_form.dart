import 'package:appidea/app/view/secao_form_back.dart';
import 'package:flutter/material.dart';

class SecaoForm extends StatelessWidget {

  final _form = GlobalKey<FormState>();

  Widget fieldName(SecaoFormBack back) {
    return TextFormField(
      initialValue: back.secao.nome,
      onSaved: (newValue) => back.secao.nome = newValue!,
      decoration: InputDecoration(
        labelText: "Nome"
      )
    );
  }

  Widget fieldCor(SecaoFormBack back) {
    return TextFormField(
      initialValue: back.secao.cor,
      onSaved: (newValue) => back.secao.cor = newValue!,
      decoration: InputDecoration(
        labelText: "Cor"
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    var _back = SecaoFormBack(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Seção'),
        actions: [
          IconButton(
            onPressed: () {
              _form.currentState!.save();
              _back.save();
              Navigator.of(context).pop();
              },
            icon: Icon(Icons.save)
            )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Form(
          key: _form,
          child: Column(
            children: [
              fieldName(_back),
              fieldCor(_back)
            ],
          ),
        ),
      )
    );
  }
}
