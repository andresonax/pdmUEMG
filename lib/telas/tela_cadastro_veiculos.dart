import 'package:flutter/material.dart';
import 'package:navegacao_roteiro/componentes/drawer_personalisado.dart';
import 'package:navegacao_roteiro/componentes/montadora_item_lista.dart';
import 'package:navegacao_roteiro/componentes/veiculo_item_lista.dart';
import 'package:navegacao_roteiro/models/montadora.dart';
import 'package:navegacao_roteiro/models/veiculos.dart';

import 'package:navegacao_roteiro/providers/montadoras.dart';
import 'package:navegacao_roteiro/providers/veiculos.dart';
import 'package:navegacao_roteiro/utils/rotas.dart';
import 'package:provider/provider.dart';

class TelaCadastroVeiculo extends StatefulWidget {
  @override
  _TelaCadastroVeiculoState createState() => _TelaCadastroVeiculoState();
}

class _TelaCadastroVeiculoState extends State<TelaCadastroVeiculo> {
  bool _isLoading = false;
  List<Veiculos> veiculos = [];
  Future<void> _atualizarLista(BuildContext context, Montadora montadora) {
    return Provider.of<MontadorasProvider>(context, listen: false)
        .buscaMontadoras();
  }

  // @override
  // void initState() {
  //   super.initState();
  //   Provider.of<VeiculosProvider>(context, listen: false)
  //       .buscaVeiculos(montadora)
  //       .then((_) {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final montadora = ModalRoute.of(context).settings.arguments as Montadora;
    //veiculos = _atualizarLista(context, montadora);
    Provider.of<VeiculosProvider>(context).buscaVeiculos(montadora);
    print(veiculos);
    return Scaffold(
      appBar: AppBar(
        title: Text("Veículos - ${montadora.nome}"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(
                Rotas.FORM_VEICULOS,
                arguments: montadora,
              );
            },
          )
        ],
      ),
      drawer: DrawerPersonalisado(),
      //ENVOLVI O PADDING COM O REFRESHINDICATOR
      //ESTE WIDEGT ATUALIZARÁ NOSSA LISTA QUANDO "PUXAR PARA BAIXO"
      //CRIEI A FUNÇÃO PARA RETORNAR ISSO
      body: RefreshIndicator(
        onRefresh: () => _atualizarLista(context, montadora),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: ListView.builder(
            itemCount: veiculos.length,
            itemBuilder: (ctx, i) => Column(
              children: [
                ItemListaVeiculo(veiculos[i]),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
