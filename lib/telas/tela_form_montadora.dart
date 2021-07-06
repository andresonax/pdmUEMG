import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:navegacao_roteiro/models/montadora.dart';

//import 'package:http/http.dart' as http;
import 'package:navegacao_roteiro/providers/montadoras.dart';
//import 'package:navegacao_roteiro/utils/variaveis.dart';
import 'package:provider/provider.dart';

class TelaFormMontadora extends StatefulWidget {
  @override
  TelaFormMontadoraState createState() => TelaFormMontadoraState();
}

class TelaFormMontadoraState extends State<TelaFormMontadora> {
  final form = GlobalKey<FormState>();
  final dadosForm = Map<String, Object>();

  //recebo a montadora como parâmetro para receber o id atual
  void saveForm(context, Montadora montadora) {
    var formValido = form.currentState.validate();

    form.currentState.save();

    //eu estava montando o id via Random, agora vou inserir o id para atualização
    //caso o usuário tenha clicado em um produto

    final novaMontadora = Montadora(
        id: montadora != null ? montadora.id : montadora,
        nome: dadosForm['nome'],
        cor: dadosForm['cor']);

    if (formValido) {
      if (montadora != null) {
        Provider.of<MontadorasProvider>(context, listen: false)
            .patchMontadoras(novaMontadora);
        Navigator.of(context).pop();
      } else {
        Provider.of<MontadorasProvider>(context, listen: false)
            .postMontadoras(novaMontadora);
        Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    //COMO ESTOU ENVIANDO A MONTADORA PELA NAVEGAÇÃO VOU CARREGAR ABAIXO CASO EXISTA
    final montadora = ModalRoute.of(context).settings.arguments as Montadora;
    print(montadora);
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulário Montadora"),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                saveForm(context, montadora);
              })
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: form,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Nome Montadora'),
                textInputAction: TextInputAction.next,
                //utilizo o initialValue como valor inicial caso a montadora tenha
                //sido encaminhada via navegação
                initialValue: montadora != null ? montadora.nome : '',
                onSaved: (value) {
                  dadosForm['nome'] = value;
                },
                validator: (value) {
                  if (value.trim().isEmpty) {
                    return "Informe um nome válido";
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Cor'),
                textInputAction: TextInputAction.done,
                onSaved: (value) {
                  dadosForm['cor'] = value;
                },
                initialValue: montadora != null ? montadora.cor : '',
                onFieldSubmitted: (_) {
                  saveForm(context, montadora);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
