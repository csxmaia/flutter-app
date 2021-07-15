
import 'package:appidea/app/domain/entities/secao.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'secao_form_back.g.dart';

class SecaoFormBack = _SecaoFormBack with _$SecaoFormBack;

abstract class _SecaoFormBack with Store {

late Secao secao;

//diferneciar novo com alteração

_SecaoFormBack(BuildContext context) {
  var parameter = ModalRoute.of(context)?.settings.arguments;
  secao = (parameter == null)? Secao(id: 0, nome: "", cor: "") : parameter as Secao;
}

//salvar

//validar

}