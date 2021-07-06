import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:navegacao_roteiro/models/montadora.dart';
import 'package:navegacao_roteiro/models/veiculos.dart';

//import 'package:http/http.dart' as http;
import 'package:navegacao_roteiro/providers/montadoras.dart';
import 'package:navegacao_roteiro/providers/veiculos.dart';
//import 'package:navegacao_roteiro/utils/variaveis.dart';
import 'package:provider/provider.dart';

class TelaFormVeiculo extends StatefulWidget {
  @override
  TelaFormVeiculoState createState() => TelaFormVeiculoState();
}

class TelaFormVeiculoState extends State<TelaFormVeiculo> {
  final form = GlobalKey<FormState>();
  final dadosForm = Map<String, Object>();

  //recebo a montadora como parâmetro para receber o id atual
  void saveForm(context, Montadora montadora) {
    var formValido = form.currentState.validate();

    form.currentState.save();

    //eu estava montando o id via Random, agora vou inserir o id para atualização
    //caso o usuário tenha clicado em um produto

    final novoVeiculo = Veiculos(
      id: null,
      id_montadora: montadora.id,
      modelo: dadosForm['modelo'],
      ano: dadosForm['ano'],
      combustivel: dadosForm['combustivel'],
      valor: 0.0,
      imagem: dadosForm['imagem'],
    );

    if (formValido) {
      Provider.of<VeiculosProvider>(context, listen: false)
          .postVeiculos(novoVeiculo);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    //COMO ESTOU ENVIANDO A MONTADORA PELA NAVEGAÇÃO VOU CARREGAR ABAIXO CASO EXISTA
    //final veiculo = ModalRoute.of(context).settings.arguments as Veiculos;
    final montadora = ModalRoute.of(context).settings.arguments as Montadora;
    print(montadora);
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulário Veículo"),
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
                decoration: InputDecoration(labelText: 'Modelo'),
                textInputAction: TextInputAction.next,
                //utilizo o initialValue como valor inicial caso a montadora tenha
                //sido encaminhada via navegação
                //initialValue: veiculo != null ? veiculo.modelo : '',
                onSaved: (value) {
                  dadosForm['modelo'] = value;
                },
                validator: (value) {
                  if (value.trim().isEmpty) {
                    return "Informe um modelo válido";
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Ano'),
                textInputAction: TextInputAction.next,
                onSaved: (value) {
                  dadosForm['ano'] = value;
                },
                //initialValue: veiculo != null ? veiculo.ano : '',
                validator: (value) {
                  if (value.trim().isEmpty) {
                    return "Informe um ano válido";
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Combustível'),
                textInputAction: TextInputAction.next,
                onSaved: (value) {
                  dadosForm['combustivel'] = value;
                },
                //initialValue: veiculo != null ? veiculo.combustivel : '',
                validator: (value) {
                  if (value.trim().isEmpty) {
                    return "Informe um ano válido";
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Valor'),
                textInputAction: TextInputAction.next,
                onSaved: (value) {
                  dadosForm['valor'] = value;
                },
                //initialValue: veiculo != null ? veiculo.valor : '',
                validator: (value) {
                  if (value.trim().isEmpty) {
                    return "Informe um valor válido";
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Imagem'),
                textInputAction: TextInputAction.done,
                onSaved: (value) {
                  dadosForm['imagem'] = value;
                },
                //initialValue: veiculo != null ? veiculo.imagem : '',
                onFieldSubmitted: (_) {
                  saveForm(context, montadora);
                },
                validator: (value) {
                  if (value.trim().isEmpty) {
                    return "Informe uma imagem válida";
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
