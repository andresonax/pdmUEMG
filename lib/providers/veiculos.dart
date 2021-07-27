import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:navegacao_roteiro/models/montadora.dart';
import 'package:http/http.dart' as http;
import 'package:navegacao_roteiro/models/veiculos.dart';
import 'package:navegacao_roteiro/utils/variaveis.dart';

//SEGUE O PADRÃO OBSERVER - A IDEIA É INFORMAR A TODOS INTERESSADOS QUE ACONTECEU ALGUMA MUDANÇA
class VeiculosProvider with ChangeNotifier {
  List<Veiculos> _veiculos = [];

//Não quero passar o controle da lista para o get
  //portanto uso o operador ... para "separar os itens" em um novo vetor
  List<Veiculos> get getMontadoras => [..._veiculos];

  void adicionarVeiculo(Veiculos veiculo) {
    _veiculos.add(veiculo);
    //nesse momento temos efetivamente uma mudança em nossos dados
    //estamos adicionando um valor a montadora portanto vamo informar ao padrão
    //que estamos realizando tal mudança
    notifyListeners();
  }

  //MÉTODO PARA CADASTRAR MONTADORAS
  Future<void> postVeiculos(Veiculos veiculo) async {
    var url = Uri.https(
        Variaveis.BACKURL, '/montadoras/${veiculo.id_montadora}/veiculos.json');
    http
        .post(url,
            body: jsonEncode(
              {
                'modelo': veiculo.modelo,
                "combustivel": veiculo.combustivel,
                "ano": veiculo.ano,
                "imagem": veiculo.imagem,
              },
            ))
        .then((value) {
      adicionarVeiculo(veiculo);
    });
  }

  //PARA FAZER REQUISIÇÕSE SINCRONAS DEVEMOS RETORNAR O FUTURE
  Future<void> buscaVeiculos(Montadora montadora) async {
    var url = Uri.https(Variaveis.BACKURL, '/montadoras/${montadora.id}.json');
    var resposta = await http.get(url);
    Map<String, dynamic> data = json.decode(resposta.body);
    _veiculos.clear();
    data.forEach((idVeiculo, dadosVeiculo) {
      // adicionarVeiculo(Veiculos(

      // ));
    });
    notifyListeners();
  }
}
