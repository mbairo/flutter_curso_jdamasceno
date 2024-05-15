import 'package:flutter/material.dart';
import 'dart:math';
void main (){
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _frases = ["Frase 1", "Frase 2", "Frase 3", "Frase 4",];
  var _fraseGerada = "Clique abaixo para gerar uma frase!";

  void _gerarFrase(){
      var numeroSorteado = Random().nextInt(_frases.length);
      setState(() {
        _fraseGerada = _frases[numeroSorteado];
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Frases do dia"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        // Faz com que o container ocupe toda a área
        width: double.infinity,

        padding: EdgeInsets.all(16),
        // decoration: BoxDecoration(
        //   border: Border.all(width: 3, color: Colors.amber)
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image.asset("images/logo.png")
            Image.asset("images/logo.png"),
            Text(
                _fraseGerada,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 17,
                fontStyle: FontStyle.italic,
                color: Colors.black
              ),
            ),
            ElevatedButton(
              child: Text(
                "Nova Frase",
                style: TextStyle(
                  fontSize: 25,
                    color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
              ),
              onPressed: (){
                _gerarFrase();
              },
            )
          ],
        ),
      ),
    );
  }
}
