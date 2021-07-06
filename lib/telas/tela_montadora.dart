import 'package:flutter/material.dart';

import '../componentes/item_montadora.dart';
import '../mockdata/montadoras.dart';

class TelaMontadora extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(15),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200, //cada elemento no máximo com 200
        childAspectRatio: 1.5, //proporção de cada elemento no gridView
        crossAxisSpacing: 20, //colocando um espaçamento cruzado de tamanho 20
        mainAxisSpacing: 20, //margin entre os componentes
      ), //criar elemento com scrrol delegando como será renderizando, aqui estendedo aos eixos
      children: MONTADORAS_MOCK.map((e) {
        return ItemMontadora(e);
      }).toList()
      //Vamos preencher aqui com nossa categoria, para isso precisamos de um elemento modelo para montar nosso elemento

      ,
    );
  }
}
