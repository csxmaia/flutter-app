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
  var lista = [
    {'nome': 'To Do', 'cor': Colors.blue},
    {'nome': 'Doing', 'cor': Colors.green},
    {'nome': 'Done', 'cor': Colors.red}
  ];

  late Future<List<Secao>> secoes;

  _SecaoMain(){
    refreshSecoes();
  }

  // metodo para atualizar as secoes cadastradas
  refreshSecoes([dynamic atualizar]){
    secoes = _service.find();
  }

  // metodo para chamar o form para adicionar a seção
  formSecao(BuildContext context){
    Navigator.of(context).pushNamed(MyApp.SECAOFORM).then(refreshSecoes);
  }


  @action
  removerCor(){
    // for(var i = 0; i < lista.length; i++) {
    //   lista[i] = {'nome': lista[i]["nome"], 'cor': Colors.transparent};
    // }
    lista = [
      {'nome': 'To Do', 'cor': Colors.transparent},
      {'nome': 'Doing', 'cor': Colors.transparent},
      {'nome': 'Done', 'cor': Colors.transparent}
    ];
  }
}