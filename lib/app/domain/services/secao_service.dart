import 'package:appidea/app/database/sqlite/dao/secao_dao_impl.dart';
import 'package:appidea/app/domain/entities/secao.dart';
import 'package:appidea/app/domain/exception/domain_layer_exception.dart';
import 'package:appidea/app/domain/interfaces/secao_dao.dart';
import 'package:get_it/get_it.dart';

class SecaoService{
  var _dao = GetIt.I.get<SecaoDAO>();

  save(Secao secao){
    validarNome(secao.nome);
    validarCor(secao.cor);
    _dao.save(secao);
  }

  remove(int id){
    _dao.remove(id);
  }

  Future<List<Secao>> find(){
    Future<List<Secao>> test = _dao.find();
    return _dao.find();
  }

  validarNome(String name) {
    var min = 4;
    var max = 30;

    if(name == null) {
      throw new DomainLayerException("O nome é obrigatório");
    }
    if(name.length < min) {
      throw new DomainLayerException("O nome deve possuir no minimo $min caracteres");
    }

    if(name.length > max) {
      throw new DomainLayerException("O nome deve possuir no maximo $max caracteres");
    }
  }

  validarCor(String cor) {
    if(cor == null) {
      throw new DomainLayerException("A cor é obrigatória");
    }
  }

}