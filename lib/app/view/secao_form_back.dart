
import 'package:appidea/app/domain/entities/secao.dart';
import 'package:appidea/app/domain/services/secao_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'secao_form_back.g.dart';

class SecaoFormBack = _SecaoFormBack with _$SecaoFormBack;

abstract class _SecaoFormBack with Store {

  late Secao secao;
  var _service = GetIt.I.get<SecaoService>();

  _SecaoFormBack(BuildContext context) {
    var parameter = ModalRoute.of(context)?.settings.arguments;
    secao = (parameter == null)? Secao(nome: "", cor: "") : parameter as Secao;
  }

  //salvar
  save() async {
    await _service.save(secao);
  }
}