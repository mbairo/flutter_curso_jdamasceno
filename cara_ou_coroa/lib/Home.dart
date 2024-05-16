import 'dart:ffi';
import 'dart:math';

import 'package:cara_ou_coroa/Resultado.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _moedaRandomica() {
    var arrayDeOpcoes = ["cara", "coroa"];
    var numeroSorteado = Random().nextInt(arrayDeOpcoes.length);
    var resultadoCaraOuCoroa = arrayDeOpcoes[numeroSorteado];

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => Resultado(resultadoCaraOuCoroa)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff61bd86),
      // appBar: AppBar(
      //   backgroundColor: Colors.green,
      // ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/img/logo.png"),
            GestureDetector(
              onTap: _moedaRandomica,
              child: Image.asset("assets/img/botao_jogar.png"),
            ),
          ],
        ),
      ),
    );
  }
}
