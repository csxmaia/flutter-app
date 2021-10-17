// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tarefas_back.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TarefasBack on _TarefasBack, Store {
  final _$listaAtom = Atom(name: '_TarefasBack.lista');

  @override
  Future<List<Tarefa>?> get lista {
    _$listaAtom.reportRead();
    return super.lista;
  }

  @override
  set lista(Future<List<Tarefa>?> value) {
    _$listaAtom.reportWrite(value, super.lista, () {
      super.lista = value;
    });
  }

  final _$_TarefasBackActionController = ActionController(name: '_TarefasBack');

  @override
  dynamic loadTarefas([dynamic value]) {
    final _$actionInfo = _$_TarefasBackActionController.startAction(
        name: '_TarefasBack.loadTarefas');
    try {
      return super.loadTarefas(value);
    } finally {
      _$_TarefasBackActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
lista: ${lista}
    ''';
  }
}
