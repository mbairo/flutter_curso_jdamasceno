import 'package:cara_ou_coroa/Home.dart';
import 'package:flutter/material.dart';

class Resultado extends StatefulWidget {
  // const Resultado({super.key});

  String? sorteioVindoDaTelaPrincipal;
  Resultado(this.sorteioVindoDaTelaPrincipal); // construtor

  @override
  State<Resultado> createState() => _ResultadoState();
}

class _ResultadoState extends State<Resultado> {
  @override
  Widget build(BuildContext context) {
    var caminhoDaImg;

    if (widget.sorteioVindoDaTelaPrincipal == "cara") {
      caminhoDaImg = "assets/img/moeda_cara.png";
    } else {
      caminhoDaImg = "assets/img/moeda_coroa.png";
    }

    return Scaffold(
      backgroundColor: Color(0xff61bd86),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(caminhoDaImg),
            GestureDetector(
              child: Image.asset("assets/img/botao_voltar.png"),
              onTap: () {
                Image.asset("assets/img/botao_voltar.png");
                Navigator.pop(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
