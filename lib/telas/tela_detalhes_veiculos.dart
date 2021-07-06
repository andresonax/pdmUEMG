import 'package:flutter/material.dart';

import '../models/veiculos.dart';

class TelaDetalhes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final veiculo = ModalRoute.of(context).settings.arguments as Veiculos;
    return Scaffold(
        appBar: AppBar(
          title: Text("Detalhes do Veículo"),
        ),
        body: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(veiculo.imagem, fit: BoxFit.cover),
            ),
            Center(
              child: Text(
                veiculo.modelo,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Card(
              child: Text("Valor: ${veiculo.valor}"),
            ),
            Card(
              child: Text("Ano ${veiculo.ano}"),
            ),
            Card(
              child: Text("Combustível: ${veiculo.valor}"),
            ),
          ],
        ));
  }
}
