import 'package:flutter/material.dart';
import 'package:navegacao_roteiro/models/montadora.dart';
import 'package:navegacao_roteiro/providers/montadoras.dart';
import 'package:navegacao_roteiro/utils/rotas.dart';
import 'package:provider/provider.dart';

class ItemListaMontadora extends StatelessWidget {
  final Montadora montadora;

  ItemListaMontadora(this.montadora);

  void deleteMontadora(context, Montadora montadora) {
    Provider.of<MontadorasProvider>(context, listen: false)
        .deleteMontadoras(montadora);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(15),
      tileColor: Color(int.parse('0x${montadora.cor}')),
      title: Container(
        child: Text(
          montadora.nome,
          style: TextStyle(color: Colors.black),
        ),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            Expanded(
              child: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  //AO CHAMAR O FORM PELO EDITAR ENVIO OS ARGUMENTOS DA MONTADORA
                  Navigator.of(context).pushNamed(
                    Rotas.FORM_MONTADORAS,
                    arguments: montadora,
                  );
                },
                color: Colors.grey,
              ),
            ),
            Expanded(
              child: IconButton(
                iconSize: 20,
                icon: Icon(Icons.delete),
                onPressed: () {
                  //VOU CRIAR UM AVISO PARA O USUÁRIO NÃO APAGAR SEM CONFIRMAR
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Text("ATENÇÃO"),
                      content: Text("Está certo disso?"),
                      actions: [
                        TextButton(
                            child: Text("Não"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                        TextButton(
                            child: Text("Sim"),
                            onPressed: () {
                              deleteMontadora(context, montadora);
                              Navigator.of(context).pop();
                            })
                      ],
                    ),
                  );
                },
                color: Colors.purple,
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(Icons.car_rental),
                onPressed: () {
                  //AO CHAMAR O FORM PELO EDITAR ENVIO OS ARGUMENTOS DA MONTADORA
                  Navigator.of(context).pushNamed(
                    Rotas.CAD_VEICULOS,
                    arguments: montadora,
                  );
                },
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
