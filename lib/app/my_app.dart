import 'package:appidea/app/view/home.dart';
import 'package:appidea/app/view/tarefa_details.dart';
import 'package:appidea/app/view/tarefa_form.dart';
import 'package:appidea/app/view/tarefas.dart';
import 'package:appidea/app/view/secao_form.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  static const HOME = '/';
  static const SECAOFORM = '/secao/form';
  static const TAREFAS = '/tarefas';
  static const TAREFAFORM = '/tarefa/form';
  static const TAREFADETAILS = '/tarefa/detail/x';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        HOME: (context) => Home(title: 'Gerenciador de tarefas',),
        SECAOFORM: (context) => SecaoForm(),
        TAREFAS: (context) => Tarefas(),
        TAREFAFORM: (context) => TarefaForm(),
        TAREFADETAILS: (context) => TarefaDetails()
      });
  }
}
