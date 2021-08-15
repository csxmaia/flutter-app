import 'package:appidea/app/domain/entities/tarefa.dart';

abstract class TarefaDAO {
  save(Tarefa secao);

  remove(dynamic id);

  Future<List<Tarefa>?> find();

  Future<List<Tarefa>?> findBySecao(dynamic secao_id);
}