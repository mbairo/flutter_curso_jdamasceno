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
      appBar: AppBar(
        title: Text("Entrada de dados"),
      ),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(32),
              child: TextField(
                decoration: InputDecoration(
                    labelText: "Digite um valor"
                ),

                // text, number, emailAddress, datetime
                keyboardType: TextInputType.number,

                onSubmitted: (String textoDigitado){
                  print("Valor digitado: " + textoDigitado);
                },
                controller: _textEditingController,

                // enabled: false,
                // maxLength: 3,
                // maxLengthEnforcement: false,
                /*
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.green,
                ),
                */
                // obscureText: true,
                /*onChanged: (String textoDigitado){
                  print("Valor digitado: $textoDigitado");
                }, */

              ),
          ),
          ElevatedButton(
            child: Text(
              "Salvar",
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),
            ),
          onPressed: (){
            print("Valor digitado: " + _textEditingController.text);
          }),
        ],
      ),
    );
  }
}
