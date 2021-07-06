import 'package:flutter/material.dart';

import '../models/montadora.dart';
import '../mockdata/veiculos.dart';
import '../componentes/item_veiculo.dart';

class TelaVeiculos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final montadora = ModalRoute.of(context).settings.arguments as Montadora;
    final veiculosFiltro = VEICULOS_MOCK
        .where((element) => element.id_montadora.contains(montadora.id))
        .toList();
    return Scaffold(
        appBar: AppBar(
          title: Text('Aplicativo Veículos'),
        ),
        body: ListView.builder(
            itemCount: veiculosFiltro.length,
            itemBuilder: (ctx, index) {
              return ItemVeiculo(veiculosFiltro[index]);
            }));
  }
}
