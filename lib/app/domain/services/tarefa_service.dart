import 'package:appidea/app/database/sqlite/dao/secao_dao_impl.dart';
import 'package:appidea/app/domain/entities/tarefa.dart';
import 'package:appidea/app/domain/exception/domain_layer_exception.dart';
import 'package:appidea/app/domain/interfaces/tarefa_dao.dart';
import 'package:get_it/get_it.dart';

class TarefaService{
  var _dao = GetIt.I.get<TarefaDAO>();
  
  save(Tarefa tarefa){
    validarTitulo(tarefa.titulo);
    validarDescricao(tarefa.descricao);
    // validarFinalizado(tarefa.finalizado);
    _dao.save(tarefa);
  }

  remove(int id){
    _dao.remove(id);
  }

  Future<List<Tarefa>> findBySecaoId(int secao_id){
    return _dao.findBySecao(secao_id);
  }

  Future<List<Tarefa>> find(){
    return _dao.find();
  }

  validarTitulo(String titulo) {
    var min = 4;
    var max = 30;

    if(titulo == null) {
      throw new DomainLayerException("O titulo é obrigatório");
    }

    if(titulo.length < min) {
      throw new DomainLayerException("O titulo deve possuir no minimo $min caracteres");
    }

    if(titulo.length > max) {
      throw new DomainLayerException("O titulo deve possuir no maximo $max caracteres");
    }
  }

  validarDescricao(String descricao) {
    var max = 200;

    if(descricao.length > max) {
      throw new DomainLayerException("O titulo deve possuir no maximo $max caracteres");
    }
  }

  validarFinalizado(int? finalizado) {
    if(finalizado == null) {
      throw new DomainLayerException("É obrigatório informar a flag de finalização");
    }
  }

}