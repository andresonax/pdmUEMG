import 'dart:math';

import 'package:flutter/material.dart';
import 'package:navegacao_roteiro/componentes/card_login.dart';

class TelaLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromRGBO(200, 150, 80, 0.5),
              Color.fromRGBO(30, 99, 200, 0.9),
            ])),
          ),
          Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 70,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.orange[600],
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 8,
                          color: Colors.black38,
                          offset: Offset(0, 2),
                        )
                      ]),
                  child: Text(
                    "VeículosApp",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 40,
                    ),
                  ),
                ),
                CardLogin()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
