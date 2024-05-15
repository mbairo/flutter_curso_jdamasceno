import 'package:flutter/material.dart';

class EntradaRadioButton extends StatefulWidget {
  const EntradaRadioButton({super.key});

  @override
  State<EntradaRadioButton> createState() => _EntradaRadioButtonState();
}

class _EntradaRadioButtonState extends State<EntradaRadioButton> {
  String ? _escolhaDeGenero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Column(
            children: [

              // Text("Masculino"),
              // Radio( // se for utilizar esse é bom mudar para Row o child
              //     value: "m",
              //     groupValue: _escolhaDeGenero,
              //     onChanged: (String ? generoEscolhido){
              //       setState(() {
              //         _escolhaDeGenero = generoEscolhido;
              //       });
              //       print("Genero selecionado: $generoEscolhido");
              //     }),
              //
              // Text("Feminino"),
              // Radio(
              //     value: "f",
              //     groupValue: _escolhaDeGenero,
              //     onChanged: (String ? generoEscolhido){
              //       setState(() {
              //         _escolhaDeGenero = generoEscolhido ;
              //       });
              //       print("Genero selecionado: $generoEscolhido");
              //     }),

              RadioListTile(
                title: Text("Masculino"),
                  value: "m",
                  groupValue: _escolhaDeGenero,
                  onChanged: (String ? generoEscolhido){
                  setState(() {
                    _escolhaDeGenero = generoEscolhido;
                  });
                  print("Genero selecionado: $generoEscolhido");
                  }
              ),

              RadioListTile(
                  title: Text("Feminino"),
                  value: "f",
                  groupValue: _escolhaDeGenero,
                  onChanged: (String ? generoEscolhido){
                    setState(() {
                      _escolhaDeGenero = generoEscolhido;
                    });
                    print("Genero selecionado: $_escolhaDeGenero");
                  }
              ),

              RadioListTile(
                  title: Text("Não responder"),
                  value: "n",
                  groupValue: _escolhaDeGenero,
                  onChanged: (String ? generoEscolhido){
                    setState(() {
                      _escolhaDeGenero = generoEscolhido;
                    });
                    print("Genero selecionado: $_escolhaDeGenero");
                  }
              ),

              ElevatedButton(
                child: Text("Salvar"),
                onPressed: (){
                  setState(() {
                    print("Informação salva: $_escolhaDeGenero");
                  });
                },
              )
            ],
          ),
        ));
  }
}
