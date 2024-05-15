import 'package:flutter/material.dart';


class EntradaCheckBox extends StatefulWidget {
  const EntradaCheckBox({super.key});

  @override
  State<EntradaCheckBox> createState() => _EntradaCheckBoxState();
}

class _EntradaCheckBoxState extends State<EntradaCheckBox> {
  bool _selecionadoComidaBrasileira = false;
  bool _selecionadoComidaItaliana = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text("Entrada de dados", style: TextStyle(color: Colors.white),), backgroundColor: Colors.black,),
      body: Container(
        child: Column(
          children: [

            CheckboxListTile(
                title: Text("Comida Brasileira", style: TextStyle(color: Colors.black),),
                  subtitle: Text("A melhor comida do mundo!"),
                // activeColor: Colors.red, // Cor da caixa selecionada
                // secondary: Icon(Icons.emoji_food_beverage_outlined),
                // selected: true, // muda a cor do texto
                value: _selecionadoComidaBrasileira,
                onChanged: (bool? valor) {
                  setState(() {
                    _selecionadoComidaBrasileira = valor ?? false;
                  });
            }
            ),

            CheckboxListTile(
                title: Text("Comida Brasileira", style: TextStyle(color: Colors.black),),
                subtitle: Text("A melhor comida do mundo!"),
                // activeColor: Colors.red, // Cor da caixa selecionada
                // secondary: Icon(Icons.emoji_food_beverage_outlined),
                // selected: true, // muda a cor do texto
                value: _selecionadoComidaItaliana,
                onChanged: (bool? valor) {
                  setState(() {
                    _selecionadoComidaItaliana = valor ?? false;
                  });
                }
            ),

            ElevatedButton(
              child: Text("Salvar", style: TextStyle(fontSize: 20),),
              onPressed: () {
                print(
                      "Comida Brasileira: " + _selecionadoComidaBrasileira.toString()
                      + "\n"
                      " Comida Italiana: " + _selecionadoComidaItaliana.toString()
                );
                },
            )

            // Text("Comida Brasileira 2"),
            // Checkbox( // outra forma de Checkbox
            //     value: _estaSelecionado,
            //     onChanged: (bool ? valor){
            //       setState(() {
            //         //_estaSelecionado recebera o valor false ou true e ira atualizar o value. O ?? significa que se estiver null recebera false.
            //         _estaSelecionado = valor ?? false;
            //       });
            //       print("Checkbox: " + valor.toString());
            //
            //     },)
          ],
        ),
      ),
    );
  }
}
