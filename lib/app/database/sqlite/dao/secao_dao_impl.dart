
import 'package:appidea/app/database/sqlite/connection.dart';
import 'package:appidea/app/domain/entities/secao.dart';
import 'package:appidea/app/domain/interfaces/secao_dao.dart';
import 'package:sqflite/sqflite.dart';

class SecaoDAOImpl implements SecaoDAO {
  late Database _db;

  @override
  Future<List<Secao>> find() async {
    _db = (await Connection.get())!;
    List<Map<String, dynamic>> resultado = await _db.query('secao');
    List<Secao> lista = List.generate(resultado.length, (index){
      var linha = resultado[index];
      return Secao(
        id: linha['id'],
        nome: linha['nome'],
        cor: linha['cor']
        );
    });

    return lista;
  }

  @override
  remove(int id) async {
      _db = (await Connection.get())!;
      var sql = "DELETE FROM secao WHERE id = ?";
      _db.rawDelete(sql, [id]);
    }
  
  @override
  save(Secao secao) async {
    _db = (await Connection.get())!;
    var sql;
    if(secao.id == null) {
      sql = "INSERT INTO secao(nome, cor) VALUES(?,?)";
      _db.rawInsert(sql, [secao.nome, secao.cor]);
    } else {
      sql = "UPDATE secao SET nome = ?, cor = ? WHERE id = ?";
      _db.rawUpdate(sql,[secao.nome, secao.cor]);
    }
  }

}