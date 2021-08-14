import 'package:appidea/app/view/tarefa_form_back.dart';
import 'package:flutter/material.dart';

class TarefaForm extends StatelessWidget {

  final _form = GlobalKey<FormState>();

  Widget fieldTitulo(TarefaFormBack back) {
    return TextFormField(
        initialValue: back.tarefa.titulo,
        onSaved: (newValue) => back.tarefa.titulo = newValue!,
        decoration: InputDecoration(labelText: "Titulo"));
  }

  Widget fieldDescricao(TarefaFormBack back) {
    return TextFormField(
        initialValue: back.tarefa.descricao,
        onSaved: (newValue) => back.tarefa.descricao = newValue!,
        decoration: InputDecoration(labelText: "Descrição"));
  }

  @override
  Widget build(BuildContext context) {
    var _back = TarefaFormBack(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('+Tarefa; Seção: ${_back.tarefa.secao?.nome}'),
          actions: [
            IconButton(
                onPressed: () {
                  _form.currentState!.save();
                  _back.save();
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.save))
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(8),
          child: Form(
            key: _form,
            child: Column(
              children: [fieldTitulo(_back), fieldDescricao(_back)],
            ),
          ),
        ));
  }
}
