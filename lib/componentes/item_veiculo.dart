import 'package:flutter/material.dart';
import 'package:navegacao_roteiro/utils/rotas.dart';

//importando meu modelo
import '../models/veiculos.dart';

//importando a tela de veículos

class ItemVeiculo extends StatelessWidget {
  final Veiculos veiculo;

  const ItemVeiculo(this.veiculo);

  void _selecinarVeiculo(BuildContext context) {
    Navigator.of(context).pushNamed(
      Rotas.DETALHES_VEICULOS,
      arguments: veiculo,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _selecinarVeiculo(context);
      },
      splashColor: Colors.orange,
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 4,
          margin: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Stack(
                //Widget é opcional
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image.network(
                      veiculo.imagem,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                      width: 300,
                      color: Colors.black54,
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      child: Text(
                        veiculo.modelo,
                        style: TextStyle(fontSize: 26, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children: [
                        Icon(Icons.attach_money_sharp),
                        SizedBox(width: 5),
                        Text(
                          "R\$ ${veiculo.valor}",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.car_repair),
                        SizedBox(width: 5),
                        Text(
                          "${veiculo.combustivel}",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.calendar_today_outlined),
                        SizedBox(width: 5),
                        Text(
                          "${veiculo.ano}",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
