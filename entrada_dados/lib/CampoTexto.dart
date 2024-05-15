import 'package:flutter/material.dart';

class CampoTexto extends StatefulWidget {
  const CampoTexto({super.key});

  @override
  State<CampoTexto> createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [

          Padding(padding: EdgeInsets.all(32),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Digite um valor"
              ),
              style: TextStyle(
                fontSize: 50,
                color: Colors.green,
              ),
              onSubmitted: (String texto) {
                print("Valor digitado: $texto");
              },
              controller: _textEditingController,
            ),
          ),
          ElevatedButton(
            child: Text("Salvar", style: TextStyle(
              color: Colors.lightGreen,
              ),
            ),

            onPressed: () {
                print("Valor digitado>>>>>: $_textEditingController");
            },


          )

        ],
      ),
    );
  }
}
