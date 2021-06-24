
import 'package:appidea/app/database/sqlite/connection.dart';
import 'package:appidea/app/domain/entities/tarefa.dart';
import 'package:appidea/app/domain/interfaces/tarefa_dao.dart';
import 'package:sqflite/sqflite.dart';

class TarefaDAOImpl implements TarefaDAO {
  late Database _db;

  @override
  Future<List<Tarefa>> find() async {
    _db = (await Connection.get())!;
    List<Map<String, dynamic>> resultado = await _db.query('tarefa');
    List<Tarefa> lista = List.generate(resultado.length, (index){
      var linha = resultado[index];
      return Tarefa(
        id: linha['id'],
        titulo: linha['titulo'],
        descricao: linha['descricao'],
        finalizado: linha['finalizado']
        );
    });

    return lista;
  }

  @override
  remove(int id) async {
      _db = (await Connection.get())!;
      var sql = "DELETE FROM tarefa WHERE id = ?";
      _db.rawDelete(sql, [id]);
    }
  
  @override
  save(Tarefa tarefa) async {
    _db = (await Connection.get())!;
    var sql;
    if(tarefa.id == null) {
      sql = "INSERT INTO tarefa(titulo, descricao, finalizado) VALUES(?,?)";
      _db.rawInsert(sql, [tarefa.titulo, tarefa.descricao, tarefa.finalizado]);
    } else {
      sql = "UPDATE tarefa SET titulo = ?, descricao = ?, finalizado = ? WHERE id = ?";
      _db.rawUpdate(sql,[tarefa.titulo, tarefa.descricao, tarefa.finalizado]);
    }
  }

}