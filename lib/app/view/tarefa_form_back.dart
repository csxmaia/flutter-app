import 'package:appidea/app/domain/entities/tarefa.dart';
import 'package:appidea/app/domain/services/tarefa_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'tarefa_form_back.g.dart';

class TarefaFormBack = _TarefaFormBack with _$TarefaFormBack;

abstract class _TarefaFormBack with Store {
  late Tarefa tarefa;
  var _service = GetIt.I.get<TarefaService>();

  _TarefaFormBack(BuildContext context) {
    dynamic parameter = ModalRoute.of(context)?.settings.arguments;
  tarefa = (parameter.id == null) ? Tarefa(titulo: "", descricao: "", secao_id: parameter.secao.id) : parameter as Tarefa;
  }

  //salvar
  save() async {
    await _service.save(tarefa);
  }
}
