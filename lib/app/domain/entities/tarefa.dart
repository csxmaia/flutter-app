import 'package:appidea/app/domain/entities/secao.dart';

class Tarefa {
  int? id;
  String titulo;
  String descricao;
  int? finalizado;
  int? secao_id;
  Secao? secao;

  Tarefa({this.id, required this.titulo, required this.descricao, this.finalizado, this.secao_id, this.secao});
}
