import 'package:appidea/app/domain/entities/tarefa.dart';
import 'package:appidea/app/view/tarefa_details_back.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../my_app.dart';

class TarefaDetails extends StatefulWidget {
  const TarefaDetails({ Key? key }) : super(key: key);

  @override
  _TarefaDetailsState createState() => _TarefaDetailsState();
}

class _TarefaDetailsState extends State<TarefaDetails> {

  launchApp(String url, BuildContext context) async{
    await canLaunch(url)? await launch(url) : showDialog(
      context: context, 
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Alerta'),
          content: Text('Não foi possivel encontrar um APP compativel')
        )
      }
      );
  }

  showModalError(){
    var alert = AlertDialog(
      title: Text('Alerta'),
      content: Text('Não foi possivel encontrar um APP compativel')
    );
    showDialog(
      context: context, 
      builder: (BuildContext context) {
        return alert;
      }
      );
  }

  @override
  Widget build(BuildContext context) {
    var _back = TarefaDetailsBack(context);
    Tarefa tarefa = _back.tarefa;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints){
        // var width = constraints.biggest.width;
        // var height = constraints.biggest.height;

        return Scaffold(
          body: ListView(
            children: [
              Center(
                child: Text('${tarefa.titulo}', style: TextStyle(fontSize: 30),),
                ),
                Card(
                  child: ListTile(
                    title: Text('Assunto'),
                    subtitle: Text('${tarefa.descricao}'),
                    onTap: _back.launchEmail(showModalError())
                  ),
                )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.arrow_back),
            onPressed: (){
              _back.goToBack();
            },
          ),
        );
      },
      );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("Tarefa X"),
    //     actions: [
    //       IconButton(
    //         icon: Icon(Icons.add),
    //         onPressed: () {
    //           Navigator.of(context).pushNamed(MyApp.TAREFAFORM);
    //         }
    //       )
    //     ],
    //   ),
    //   body: Center(
    //     child: Column(
    //       children: <Widget>[
    //         Text("Titulo tarefa X"),
    //         Text("Descricao tarefa X"),
    //       ]
    //     )
    //    )
      
    // );
  }
}