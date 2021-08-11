import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:navegacao_roteiro/utils/store.dart';

class Login with ChangeNotifier {
  DateTime dataExpiracao;
  String token;
  Timer tempoLogout;

  bool get logado {
    return (getToken != null);
  }

  String get getToken {
    if (token != null &&
        dataExpiracao != null &&
        dataExpiracao.isAfter(DateTime.now())) {
      return token;
    } else {
      return null;
    }
  }

  Future<void> registrar(String email, String senha) async {
    final url = Uri.https(
      'identitytoolkit.googleapis.com',
      '/v1/accounts:signUp',
      {"key": "AIzaSyDxURk9gBW0swaCbqXCsM_JdZauhyO1FIM"},
    );
    final resposta = await http.post(
      url,
      body: json.encode({
        "email": email,
        "password": senha,
        "returnSecureToken": true,
      }),
    );
    //print(json.decode(resposta.body));
    return Future.value();
  }

  void logout() {
    token = null;
    dataExpiracao = null;
    if (tempoLogout != null) {
      tempoLogout.cancel();
    }
    Store.remover('dadosUsuario');
    notifyListeners();
  }

  void autoLogout() {
    final tempoParaSair = dataExpiracao.difference(DateTime.now()).inSeconds;
    if (tempoLogout != null) {
      tempoLogout.cancel();
    }
    tempoLogout = Timer(Duration(seconds: tempoParaSair), logout);
  }

  Future<void> realizaLogin(String email, String senha) async {
    final url = Uri.https(
      'identitytoolkit.googleapis.com',
      '/v1/accounts:signInWithPassword',
      {"key": "AIzaSyDxURk9gBW0swaCbqXCsM_JdZauhyO1FIM"},
    );
    final resposta = await http.post(
      url,
      body: json.encode({
        "email": email,
        "password": senha,
        "returnSecureToken": true,
      }),
    );

    final respostaAutenticacao = json.decode(resposta.body);
    if (respostaAutenticacao['error'] != null) {
      throw Exception(respostaAutenticacao['error']);
    } else {
      token = respostaAutenticacao['idToken'];
      dataExpiracao = DateTime.now().add(
        Duration(
          seconds: int.parse(respostaAutenticacao['expiresIn']),
        ),
      );

      Store.saveMap('dadosUsuario', {
        "token": token,
        "dataExpiracao": dataExpiracao.toIso8601String(),
      });
      autoLogout();
      notifyListeners();
    }
    return Future.value(json.decode(resposta.body));
  }

  Future<void> realizarLoginAutomatico() async {
    if (logado) {
      return Future.value();
    }
    final dadosUsuario = await Store.getMap('dadosUsuario');

    if (dadosUsuario == null) {
      return Future.value();
    }
    final expiracao = DateTime.parse(dadosUsuario['dataExpiracao']);
    if (expiracao.isBefore(DateTime.now())) {
      return Future.value();
    }

    token = dadosUsuario['token'];
    dataExpiracao = expiracao;
    return Future.value();
  }
}
