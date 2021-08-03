import 'package:flutter/material.dart';
import 'package:navegacao_roteiro/providers/montadoras.dart';
import 'package:navegacao_roteiro/providers/veiculos.dart';
import 'package:navegacao_roteiro/providers/login.dart';
import 'package:navegacao_roteiro/telas/tela_cadastro_montadoras.dart';
import 'package:navegacao_roteiro/telas/tela_escolhe_home.dart';
import 'package:navegacao_roteiro/telas/tela_login.dart';
import 'package:navegacao_roteiro/telas/tela_cadastro_veiculos.dart';
import 'package:navegacao_roteiro/telas/tela_form_montadora.dart';
import 'package:navegacao_roteiro/telas/tela_form_veiculo.dart';
import 'package:navegacao_roteiro/utils/rotas.dart';
import 'package:provider/provider.dart';

import 'telas/tela_veiculos.dart';
import 'telas/tela_detalhes_veiculos.dart';
import 'telas/tela_guias.dart';
import 'telas/tela_parametros.dart';

void main() {
  runApp(MyApp());
}

//O provider tem que ser inserido no momento em que queremos informar alterações
//Nesse caso vou colocar para toda a aplicação
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Login(),
        ),
        ChangeNotifierProxyProvider<Login, MontadorasProvider>(
          create: (ctx) => MontadorasProvider('', []),
          update: (ctx, login, montadoras) =>
              MontadorasProvider(login.token, montadoras.getMontadoras),
        ),
        ChangeNotifierProvider(
          create: (ctx) => VeiculosProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.green),
        routes: {
          Rotas.ESCOLHE_TELA: (ctx) => TelaEscolheHome(),
          Rotas.HOME: (ctx) => TelaTabulacao(),
          Rotas.VEICULOS: (ctx) => TelaVeiculos(),
          Rotas.DETALHES_VEICULOS: (ctx) => TelaDetalhes(),
          Rotas.PARAMETROS: (ctx) => TelaParametros(),
          Rotas.CAD_MONTADORAS: (ctx) => TelaCadastroMontadora(),
          Rotas.FORM_MONTADORAS: (ctx) => TelaFormMontadora(),
          Rotas.CAD_VEICULOS: (ctx) => TelaCadastroVeiculo(),
          Rotas.FORM_VEICULOS: (ctx) => TelaFormVeiculo(),
        },
        onGenerateRoute: (settings) {
          //print(settings.name);
          return null;
        },
        onUnknownRoute: (settings) {
          //print("rota nao encontrada");
          return null;
        },
      ),
    );
  }
}
