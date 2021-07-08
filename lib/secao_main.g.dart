// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'secao_main.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SecaoMain on _SecaoMain, Store {
  final _$listaAtom = Atom(name: '_SecaoMain.lista');

  @override
  List<Map<String, Object>> get lista {
    _$listaAtom.reportRead();
    return super.lista;
  }

  @override
  set lista(List<Map<String, Object>> value) {
    _$listaAtom.reportWrite(value, super.lista, () {
      super.lista = value;
    });
  }

  final _$_SecaoMainActionController = ActionController(name: '_SecaoMain');

  @override
  dynamic removerCor() {
    final _$actionInfo =
        _$_SecaoMainActionController.startAction(name: '_SecaoMain.removerCor');
    try {
      return super.removerCor();
    } finally {
      _$_SecaoMainActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
lista: ${lista}
    ''';
  }
}
