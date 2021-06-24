import 'package:appidea/app/domain/entities/tarefa.dart';

abstract class TarefaDAO {
  save(Tarefa secao);

  remove(int id);

  Future<List<Tarefa>> find();
}