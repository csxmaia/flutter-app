import 'package:appidea/app/domain/entities/tarefa.dart';
import 'package:appidea/app/domain/interfaces/tarefa_dao.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TarefaDAOFirestore implements TarefaDAO {
  CollectionReference tarefaCollection =
      FirebaseFirestore.instance.collection('tarefa');

  SecaoDAOFirestore() {
    tarefaCollection = FirebaseFirestore.instance.collection('tarefa');
  }
  
  @override
  Future<List<Tarefa>?> find() async {
    var result = await tarefaCollection.get();
    return result.docs.map(
      (doc) => Tarefa(
        id: doc.reference.id.toString(),
        titulo: doc['titulo'], 
        descricao: doc['descricao'],
        finalizado: doc['finalizado'],
        secao_id: doc['secao_id'],
        )
    ).toList();
  }

  @override
  Future<List<Tarefa>?> findBySecao(secao_id) async {
    var result = await tarefaCollection.where({'secao_id', '==', secao_id}).get();
    return result.docs.map(
      (doc) => Tarefa(
        id: doc.reference.id.toString(),
        titulo: doc['titulo'], 
        descricao: doc['descricao'],
        finalizado: doc['finalizado'],
        secao_id: doc['secao_id'],
        )
    ).toList();
  }

  @override
  remove(id) {
    tarefaCollection.doc(id).delete();
  }

  @override
  save(Tarefa tarefa) {
    tarefaCollection.doc(tarefa.id).set(
      {
          'titulo': tarefa.titulo,
          'descricao': tarefa.descricao,
          'finalizado': tarefa.finalizado,
          'secao_id': tarefa.secao_id
      }
    );
  }

}