import 'package:flutter/material.dart';

class EntradaSlider extends StatefulWidget {
  const EntradaSlider({super.key});

  @override
  State<EntradaSlider> createState() => _EntradaSliderState();
}

class _EntradaSliderState extends State<EntradaSlider> {
  double _posicaoSeletor = 5;
  String _labelText = "Valor selecionado";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Container(
        // padding: EdgeInsets.only(left: 50, right: 50),
        padding: EdgeInsets.all(30),
        child: Column(
          children: [

            Slider(
                value: _posicaoSeletor,
                min: 0,
                max: 10,
                label:_labelText + " " + _posicaoSeletor.toString(),
                divisions: 20,
                activeColor: Colors.red,
                // inactiveColor: Colors.blue,
                onChanged: (double novaPosicao){
                  setState(() {
                    _posicaoSeletor = novaPosicao;
                  });
                  print("Seletor>>> $novaPosicao");
                },
          ),
            ElevatedButton(
              child: Text("Salvar"),
                onPressed: (){
                  setState(() {
                  print("Salvo a nota: $_posicaoSeletor");

                  });
                }
                ,
            ),
        ]),
      ),
    );
  }
}
