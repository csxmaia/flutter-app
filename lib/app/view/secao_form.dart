import 'package:appidea/app/view/secao_form_back.dart';
import 'package:flutter/material.dart';

class SecaoForm extends StatelessWidget {
  const SecaoForm({Key? key}) : super(key: key);

  Widget fieldName(SecaoFormBack back) {
    return TextFormField(
      initialValue: back.secao.nome,
      decoration: InputDecoration(
        labelText: "Nome"
      )
    );
  }

  Widget fieldCor(SecaoFormBack back) {
    return TextFormField(
      initialValue: back.secao.cor,
      decoration: InputDecoration(
        labelText: "Cor"
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    var _back = SecaoFormBack(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Seção'),
        actions: [
          IconButton(
            onPressed: null, 
            icon: Icon(Icons.save)
            )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Form(
          child: Column(
            children: [
              fieldName(_back),
              fieldCor(_back)
            ],
          ),
        ),
        // child: Column(
        //   children: <Widget>[
        //     Text('label("Nome")'),
        //     Text('input("Nome")'),
        //     Text('label("Cor")'),
        //     Text('input("Cor")'),
        //     Text('Button Salvar')
        //   ],
        // )
      )
    );
  }
}
