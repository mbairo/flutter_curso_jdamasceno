import 'package:flutter/material.dart';

class TelaContato extends StatefulWidget {
  const TelaContato({super.key});

  @override
  State<TelaContato> createState() => _TelaContatoState();
}

class _TelaContatoState extends State<TelaContato> {
  // Lista de textos que serão exibidos
  final List<String> contatos = [
    "atendimento@atmconsultoria.com.br",
    "Telefone: (41) 1234-5678",
    "Celular: (41) 8765-4321"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Tela Contato"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset("img/detalhe_contato.png"),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Nossos Contatos",
                      style: TextStyle(
                        color: Colors.amber[700],
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
              // Utilizando a lista de textos com map para evitar repetição
              ...contatos.map((contato) => Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text(contato),
              )).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
