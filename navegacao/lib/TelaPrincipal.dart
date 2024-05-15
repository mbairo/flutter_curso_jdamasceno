import 'package:flutter/material.dart';
import 'package:navegacao/TelaSecundaria.dart';
class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela principal"),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        // padding: EdgeInsets.all(30) ,
        child: Column(
          children: [

            Padding(padding: EdgeInsets.all(10), // adiciona um padding em volta do botão
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(padding: EdgeInsets.all(15)), // padding dentro do botão. Em vonlta do texto
                child: Text("Ir para a segunda tela"),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TelaSecundaria()),
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}