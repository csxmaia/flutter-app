import 'package:flutter/material.dart';

import '../my_app.dart';


class Home extends StatelessWidget {
  static final lista = [
    {'nome': 'To Do', 'cor': 'blue'},
    {'nome': 'Doing', 'cor': 'green'},
    {'nome': 'Done', 'cor': 'red'}
  ];
  Home({Key? key, required this.title}) : super(key: key);
  final String title;
  // a programacao assincrona tem como base, realizar uma operação,
  // bloco de comandos (por meio de uma função assincrona) e afins sem
  // a possibilidade de que o programa aguarde a finalização dessa operação.
  // Ela permite que essa operação seja executada ao mesmo tempo em que o programa
  // continua executando suas outras operações de maneira sincrona

  //Future é uma classe do Dart, com ele é possivel "declarar" que aquele
  //bloco de objetos será executado no futuro, não interrompendo a sincronidade
  //da etapa do programa que estará executando quando o conteudo de Future
  //inicar sua execução
  //
  // Definindo uma função como async, podemos utilizar o await, onde a palavra
  // chave await define que a instução a seguir à palavra, devera executar
  // e finalizar sua operação e só assim dar continuidade na sua sequencia de 
  // operações, sendo tambem necessario a utilização da palavra chave async na função para
  // a utilização do await


  // Exemplo de future, prototipando uma realizacao de operacao no servidor de maneira fake
  Future realizaOperacoesNoServidor(context){
    print("realizando operacoes no servidor e organizando as tarefas");
    return Future.delayed(Duration(seconds: 2), () => {
      print("tarefas obtidas, enviando para a tela"),
      Navigator.of(context).pushNamed(MyApp.TAREFAS)
    });
  }

  //exemplod e async e await
  void salvarDados(data) async {
    print("pegando os dados...");
    print("enviando os dados ao servidor");
    bool response = await apiEnviaDadosServidor(data);
    if(response == true) {
      print("dados salvos no banco de dados");
    }else {
      print("erro ao salvar dados no banco de dados");
    }

  }

  Future apiEnviaDadosServidor( data ) {
    print("fetchHttpPost" + data);
    return Future.value(true);
  }

  //exemplo de async e await
  void buscarInformacoesDeFilmes(nome) async {
    print("pegando nome do filme...");
    print("realizando requisicao na api do imdb");
    var filmedata = await consultaIMDB(nome);
    print("informacoes do filme" + filmedata);
  }

  Future consultaIMDB(nome) {
      print("fetchHttpGetIMDB");
      return Future.value({'nome': 'nomefilme', 'ano': 2021});
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, i){
          var item = lista[i];
          return ListTile(
            title: Text(item['cor']! + "  " + item['nome']!),
            trailing: Text(item['cor']!),
            onTap: () => realizaOperacoesNoServidor(context)
          );
          // TextButton(
          //     style: TextButton.styleFrom(
          //       textStyle: const TextStyle(fontSize: 20),
          //     ),
          //     onPressed: () {
          //       Navigator.of(context).pushNamed(MyApp.TAREFAS);
          //     },
          //     child: const Text(item['nome']),
          //   );
        }
      ),
      // body: Center(
      //   child: Column(
      //     children: [
      //       TextButton(
      //         style: TextButton.styleFrom(
      //           textStyle: const TextStyle(fontSize: 20),
      //         ),
      //         onPressed: () {
      //           Navigator.of(context).pushNamed(MyApp.TAREFAS);
      //         },
      //         child: const Text('To Do'),
      //       ),
      //       TextButton(
      //         style: TextButton.styleFrom(
      //           textStyle: const TextStyle(fontSize: 20),
      //         ),
      //         onPressed: () {
      //           Navigator.of(context).pushNamed(MyApp.TAREFAS);
      //         },
      //         child: const Text('Doing'),
      //       ),
      //       TextButton(
      //         style: TextButton.styleFrom(
      //           textStyle: const TextStyle(fontSize: 20),
      //         ),
      //         onPressed: () {
      //           Navigator.of(context).pushNamed(MyApp.TAREFAS);
      //         },
      //         child: const Text('Done'),
      //       ),
      //     ],
      //   )
      // ),
      floatingActionButton: FloatingActionButton(
        // onPressed: ),
        tooltip: 'Adicionar Seção',
        onPressed: () {
          Navigator.of(context).pushNamed(MyApp.SECAOFORM);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
