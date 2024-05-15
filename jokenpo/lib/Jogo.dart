import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({super.key});

  @override
  State<Jogo> createState() => _JogoState();
}
class _JogoState extends State<Jogo> {
  var _imgApp = AssetImage("img/padrao.png");
  var _msgDoResultado = "Escolha uma opção abaixo";

  void _opcaoSelecionada(String escolhaUsuario){
    List listaDeOpcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = listaDeOpcoes[numero];

    print("Escolha do App: $escolhaApp");
    print("Escolha do Usuario: $escolhaUsuario");

    switch(escolhaApp){
      case "pedra":
        setState(() {
          this._imgApp = AssetImage("img/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          this._imgApp = AssetImage("img/papel.png");
        });
        break;
        case "tesoura":
          setState(() {
            this._imgApp = AssetImage("img/tesoura.png");
          });
          break;
    }
    if(
        (escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra")
    ) {
        _msgDoResultado = "Usuário ganhou!";
    } else if(
        (escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
        (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
        (escolhaApp == "papel" && escolhaUsuario == "pedra")
    ){
      _msgDoResultado = "App ganhou!";
    } else {
      _msgDoResultado = "Empate";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
                "Escolha do App:",
                textAlign: TextAlign.center,
                style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          
          // Img da esolha do app
          Image(image: this._imgApp),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._msgDoResultado,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              child: Image.asset("img/pedra.png", height: 100),
              onTap: () => _opcaoSelecionada("pedra"),
            ),

            GestureDetector(
              child: Image.asset("img/papel.png", height: 100),
              onTap: () => _opcaoSelecionada("papel"),
            ),

            GestureDetector(
              child: Image.asset("img/tesoura.png", height: 100),
              onTap: () => _opcaoSelecionada("tesoura"),
            )
          ],
        )
      ],
    ),
    );
  }
}
