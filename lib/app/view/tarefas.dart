import 'package:appidea/app/domain/entities/secao.dart';
import 'package:appidea/app/domain/entities/tarefa.dart';
import 'package:appidea/app/view/tarefas_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../my_app.dart';

class Tarefas extends StatefulWidget {
  const Tarefas({Key? key}) : super(key: key);

  @override
  _TarefasState createState() => _TarefasState();
}

class _TarefasState extends State<Tarefas> {
  @override
  Widget build(BuildContext context) {
    // Secao? secao = ModalRoute.of(context)!.settings.arguments as Secao?;

    final _back = TarefasBack();
    _back.secao = ModalRoute.of(context)!.settings.arguments as Secao?;
    
    _back.loadTarefas();


    void _configurandoModalBottomSheet(context, tarefa) {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext bc) {
            return Container(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: new Icon(Icons.edit, color: Colors.amber),
                      title: new Text('Editar'),
                      onTap: () => {
                            Navigator.of(context).pop(),
                            _back.goToForm(context, tarefa)
                          }),
                  ListTile(
                    leading: new Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    title: new Text('Deletar'),
                    onTap: () => {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                  title: Text("Excluir"),
                                  content: Text("Confirma a exclusão?"),
                                  actions: [
                                    FlatButton(
                                        child: Text('Cancelar'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        }),
                                    FlatButton(
                                      child: Text("Confirma"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        _back.remover(tarefa.id);
                                      },
                                    )
                                  ]))
                    },
                  ),
                ],
              ),
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Tarefas ${_back.secao?.nome}"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _back.goToForm(context);
            }
          )
        ],
      ),
      body: Observer(builder: (context) {
        return FutureBuilder(
          future: _back.lista,
          builder: (context, futuro) {
            if(!futuro.hasData) {
              return CircularProgressIndicator();
            } else {
              List<Tarefa>? lista = futuro.data as List<Tarefa>?;
              return ListView.builder(
                  itemCount:  lista!.length,
                  itemBuilder: (context, i){
                    var item = lista[i];
                    return ListTile(
                        title: Text("${item.titulo}"),
                        // title: Text("Teste"),
                        onTap: (){
                          _back.goToDetails(context, item);
                        },
                        onLongPress: (){
                          _configurandoModalBottomSheet(context, item);
                        },
                    );
                  }
              );
            }
          }
        );
      }
    ),
    );
  }
}
