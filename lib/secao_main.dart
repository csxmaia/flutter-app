import 'package:appidea/app/domain/entities/secao.dart';
import 'package:appidea/app/domain/services/secao_service.dart';
import 'package:appidea/app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'secao_main.g.dart';

class SecaoMain = _SecaoMain with _$SecaoMain;

abstract class _SecaoMain with Store{
  var _service = GetIt.I.get<SecaoService>();

  @observable
  Future<List<Secao>> lista = GetIt.I.get<SecaoService>().find();

  _SecaoMain(){
    refreshSecoes();
  }

  // metodo para atualizar as secoes cadastradas
  @action
  refreshSecoes([dynamic value]){
    lista = _service.find();
  }

  // metodo para chamar o form para adicionar a seção
  formSecao(BuildContext context, [Secao? secao]){
    Navigator.of(context).pushNamed(MyApp.SECAOFORM, arguments: secao).then(refreshSecoes);
  }

  goToTarefas(BuildContext context, Secao secao){
    Navigator.of(context).pushNamed(MyApp.TAREFAS, arguments: secao);
  }

  remover(dynamic id){
    _service.remove(id);
    refreshSecoes();
  }
}