import 'dart:convert';

import 'package:appidea/app/domain/entities/secao.dart';
import 'package:appidea/app/domain/interfaces/secao_dao.dart';
import 'package:http/http.dart' as http;

class SecaoDAOMySQL implements SecaoDAO {
  final uriBase = Uri.parse('http://192.168.1.13:8080/secao');
  
  @override
  Future<List<Secao>?> find() async{
    var response = await http.get(uriBase);
    if(response.statusCode != 200) throw Exception("Erro Rest API.");
    Iterable listDart = json.decode(response.body);
    var listSecao = List<Secao>.from(
      listDart.map((item) => Secao(
        id: item['id'],
        nome: item['nome'],
        cor: item['cor']
      ))
    );
  }

  @override
  remove(id) async{
    var uri = Uri.parse('http://192.168.1.13:8080/secao/$id');
    var response = await http.delete(uri);
    if(response.statusCode != 200) throw Exception("Erro Rest API.");
  }

  @override
  save(Secao secao) async{
    var headers = {
      'Content-Type': 'application/json'
    };
    var contentJson = jsonEncode(
      {
        'id': secao.id,
        'cor': secao.cor,
        'nome': secao.nome
      }
    );
    int statusCode = 0;
    if(secao.id == null) {
      var response = await http.post(uriBase, headers: headers, body: contentJson);
      statusCode = response.statusCode;
    } else {
      var response = await http.put(uriBase, headers: headers, body: contentJson);
      statusCode = response.statusCode;
    }
    if(statusCode != 200) throw Exception("Erro Rest API.");
  }
  
}