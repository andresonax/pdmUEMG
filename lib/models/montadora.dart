import 'package:flutter/material.dart';
import 'package:navegacao_roteiro/models/veiculos.dart';

class Montadora {
  final String id;
  final String nome;
  //Mudei a cor de Color pra String
  final String cor;
  //Inseri o vetor e veículos
  final List<Veiculos> veiculos;

  const Montadora({
    @required this.id,
    @required this.nome,
    this.cor = "#ff00ff",
    this.veiculos,
  });
}
