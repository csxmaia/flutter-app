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
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        // home: Home(title: 'Gerenciador de tarefas'),
        routes: {
          HOME: (context) => Home(title: 'Gerenciador de tarefas',),
          SECAOFORM: (context) => SecaoForm(),
          TAREFAS: (context) => Tarefas(),
          TAREFAFORM: (context) => TarefaForm(),
          TAREFADETAILS: (context) => TarefaDetails()
        });
  }
}
