import 'package:flutter/material.dart';

import 'tela_montadora.dart';
import 'tela_favoritos.dart';

import '../componentes/drawer_personalisado.dart';

class TelaTabulacao extends StatefulWidget {
  @override
  _TelaTabulacaoState createState() => _TelaTabulacaoState();
}

class _TelaTabulacaoState extends State<TelaTabulacao> {
  int telaSelecionada = 0;
  final List<Widget> telas = [
    TelaMontadora(),
    TelaFavoritos(),
  ];

  void selecionarTela(int tela) {
    setState(() {
      telaSelecionada = tela;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Aplicativo Veículos"),
        ),
        body: telas[telaSelecionada],
        drawer: DrawerPersonalisado(),
        bottomNavigationBar: BottomNavigationBar(
          onTap: selecionarTela,
          currentIndex: telaSelecionada,
          backgroundColor: Colors.green,
          selectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.car_rental), label: "Montadoras"),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favoritos")
          ],
        ),
      ),
    );
  }
}
