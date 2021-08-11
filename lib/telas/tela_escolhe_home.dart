import 'package:flutter/material.dart';
import 'package:navegacao_roteiro/providers/login.dart';
import 'package:navegacao_roteiro/telas/tela_guias.dart';
import 'package:navegacao_roteiro/telas/tela_login.dart';
import 'package:provider/provider.dart';

class TelaEscolheHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Login login = Provider.of(context, listen: false);
    return FutureBuilder(
      future: login.realizarLoginAutomatico(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.error != null) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        } else {
          return login.logado ? TelaTabulacao() : TelaLogin();
        }
      },
    );
  }
}
