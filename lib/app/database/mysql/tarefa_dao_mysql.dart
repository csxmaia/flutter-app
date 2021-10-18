import 'dart:convert';

import 'package:appidea/app/domain/entities/tarefa.dart';
import 'package:appidea/app/domain/interfaces/tarefa_dao.dart';
import 'package:http/http.dart' as http;

class TarefaDAOMySQL implements TarefaDAO {
  final uriBase = Uri.parse('http://192.168.1.13:8080/tarefa');
  
  @override
  Future<List<Tarefa>?> find() async {
    var response = await http.get(uriBase);
    if(response.statusCode != 200) throw Exception("Erro Rest API.");
    Iterable listDart = json.decode(response.body);
    var listSecao = List<Tarefa>.from(
      listDart.map((item) => Tarefa(
        id: item['id'],
        descricao: item['descricao'],
        titulo: item['titulo'],
        finalizado: item['finalizado'],
        secao: item['secao'] 
      ))
    );
  }

  @override
  remove(id) async{
    var uri = Uri.parse('http://192.168.1.13:8080/tarefa/$id');
    var response = await http.delete(uri);
    if(response.statusCode != 200) throw Exception("Erro Rest API.");
  }

  @override
  save(Tarefa tarefa) async{
        var headers = {
      'Content-Type': 'application/json'
    };
    var contentJson = jsonEncode(
      {
        'id': tarefa.id,
        'descricao': tarefa.descricao,
        'titulo': tarefa.titulo,
        'finalizado': tarefa.finalizado,
        'secao': tarefa.secao
      }
    );
    int statusCode = 0;
    if(tarefa.id == null) {
      var response = await http.post(uriBase, headers: headers, body: contentJson);
      statusCode = response.statusCode;
    } else {
      var response = await http.put(uriBase, headers: headers, body: contentJson);
      statusCode = response.statusCode;
    }
    if(statusCode != 200) throw Exception("Erro Rest API.");
  }

  @override
  Future<List<Tarefa>?> findBySecao(secao_id) async{
    var uri = Uri.parse('http://192.168.1.13:8080/tarefa/secao/$secao_id');
    var response = await http.get(uriBase);
    if (response.statusCode != 200) throw Exception("Erro Rest API.");
    Iterable listDart = json.decode(response.body);
    var listSecao = List<Tarefa>.from(listDart.map((item) => Tarefa(
        id: item['id'],
        descricao: item['descricao'],
        titulo: item['titulo'],
        finalizado: item['finalizado'],
        secao: item['secao'])));
  }
  
}