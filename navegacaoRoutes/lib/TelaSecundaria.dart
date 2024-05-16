import 'package:flutter/material.dart';

class TelaSecundaria extends StatefulWidget {
  // const TelaSecundaria({super.key});

  String? valorVindoDaTelaPrincipal;
  TelaSecundaria(this.valorVindoDaTelaPrincipal);

  @override
  State<TelaSecundaria> createState() => _TelaSecundariaState();
}

class _TelaSecundariaState extends State<TelaSecundaria> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Tela secundária"),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          // alinhar no centro
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Nome completo: ${widget.valorVindoDaTelaPrincipal}",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(
                        15)), // padding dentro do botão. Em vonlta do texto
                child: Text("Voltar para tela principal"),
                onPressed: () {
                  Navigator.popAndPushNamed(context, "/");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
