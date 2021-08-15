import 'package:appidea/app/domain/entities/secao.dart';

class Tarefa {
  dynamic? id;
  String titulo;
  String descricao;
  dynamic? finalizado;
  dynamic? secao_id;
  Secao? secao;

  Tarefa({this.id, required this.titulo, required this.descricao, this.finalizado, this.secao_id, this.secao});
}
