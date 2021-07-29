import 'package:appidea/app/domain/entities/tarefa.dart';
import 'package:flutter/cupertino.dart';

class TarefaDetailsBack{
  BuildContext context;
  late Tarefa tarefa;

  TarefaDetailsBack(this.context){
    tarefa = ModalRoute.of(context)!.settings.arguments;
  };

  goToBack(){
    Navigator.of(context).pop();
  }
}