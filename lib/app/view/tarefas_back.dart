import 'package:appidea/app/domain/entities/tarefa.dart';
import 'package:appidea/app/domain/entities/secao.dart';
import 'package:appidea/app/domain/services/tarefa_service.dart';
import 'package:appidea/app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'tarefas_back.g.dart';

class TarefasBack = _TarefasBack with _$TarefasBack;

abstract class _TarefasBack with Store{
  var _service = GetIt.I.get<TarefaService>();
  late Tarefa tarefa;
  late Secao? secao;

  @observable
  Future<List<Tarefa>?> lista = GetIt.I.get<TarefaService>().find();

  _TarefasBack(){
    // refreshTarefas();
  }

  // metodo para atualizar as secoes cadastradas
  @action
  loadTarefas([dynamic value]) {
    // Secao? secao = ModalRoute.of(context)!.settings.arguments as Secao?;
    int? id = this.secao!.id;
    lista = _service.findBySecaoId(id!);
  }

  goToForm(BuildContext context, [Tarefa? tarefa]) {
    // Tarefa tarefa = new Tarefa(titulo: '', descricao: '', secao: this.secao);
    Navigator.of(context).pushNamed(MyApp.TAREFAFORM, arguments: tarefa).then(loadTarefas);
  }

  goToDetails(BuildContext context, Tarefa tarefa) {
    Navigator.of(context).pushNamed(MyApp.TAREFADETAILS, arguments: tarefa);
  }

  remover(dynamic id) {
    _service.remove(id);
    loadTarefas();
  }

}