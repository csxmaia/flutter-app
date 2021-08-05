import 'package:appidea/app/domain/entities/tarefa.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class TarefaDetailsBack{
  BuildContext context;
  late Tarefa tarefa;

  TarefaDetailsBack(this.context){
    tarefa = ModalRoute.of(context)!.settings.arguments;
  };

  goToBack(){
    Navigator.of(context).pop();
  }

  _launchApp(String url, Function(BuildContext context) showModalError) async{
    await canLaunch(url)? await launch(url) : showModalError(context);
  }

  launchEmail(Function(BuildContext context) showModalError){
    _launchApp('mailto:cristhian.smaia@gmail.com?subject=${tarefa.titulo}&body=${tarefa.descricao}', showModalError);
  }
}