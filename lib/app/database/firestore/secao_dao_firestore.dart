import 'package:appidea/app/domain/entities/secao.dart';
import 'package:appidea/app/domain/interfaces/secao_dao.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SecaoDAOFirestore implements SecaoDAO {
  CollectionReference secaoCollection = FirebaseFirestore.instance.collection('secao');

  SecaoDAOFirestore() {
    secaoCollection = FirebaseFirestore.instance.collection('secao');
  }

  @override
  Future<List<Secao>?> find() async {
    var result = await secaoCollection.get();
    return result.docs.map(
      (doc) => Secao(
        id: doc.reference.id.toString(),
        nome: doc['nome'], 
        cor: doc['cor']
        )
    ).toList();
  }

  @override
  remove(id) {
    secaoCollection.doc(id).delete();
  }

  @override
  save(Secao secao) {
     secaoCollection.doc(secao.id).set({
      'nome': secao.nome,
      'descricao': secao.cor
    });
  }

}