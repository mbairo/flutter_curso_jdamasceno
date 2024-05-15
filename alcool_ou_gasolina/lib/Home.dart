import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _capturaTecladoAlcool = TextEditingController();
  TextEditingController _capturaTecladoGasolina = TextEditingController();
  String _textoResultado = "";

  void _calcular() {
    double? precoAlcool = double.tryParse( _capturaTecladoAlcool.text);
    double? precoGasolina = double.tryParse( _capturaTecladoGasolina.text);

    if(precoAlcool == null || precoGasolina == null) {
      setState(() {
        _textoResultado = "Valor invalido!";
      });
    } else if ((precoAlcool / precoGasolina) < 0.7) {
      setState(() {
        _textoResultado = "Compensa comprar Alcool";
      });
    } else {
      setState(() {
        _textoResultado = "Compensa comprar Gasolina";
      });
    }
    // _limparCampos();
  }

  // void _limparCampos() {
  //   _capturaTecladoAlcool.text = "";
  //   _capturaTecladoGasolina.text = "";
  // }


  @override
  Widget build(BuildContext context) {
    // Aqui começa
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        // Poder rolar a tela
        child: SingleChildScrollView(
          // Cria um padding geral no container (up, botton, left, right)
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              Padding(
                padding: EdgeInsets.only(bottom: 32, top: 10),
                child: Image.asset("img/logo.png"),
              ),

              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text("Saiba qual a melhor opção para abastecimento do seu carro",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Preço Alcool, ex: 5.40",
                ),
                style: TextStyle(
                    fontSize: 22
                ),
                controller: _capturaTecladoAlcool,
              ),

              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Preço Gasolina, ex: 6.30",
                ),
                style: TextStyle(
                    fontSize: 22
                ),
                controller: _capturaTecladoGasolina,
              ),

              Padding(
                padding: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                    style: ButtonStyle(
                      // backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
                        backgroundColor: MaterialStatePropertyAll(Colors.blue[400])
                    ),

                    child: Text("Calcular",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white
                        )
                    ),
                    onPressed: _calcular),
              ),

              Padding(padding:
              EdgeInsets.only(top: 20),
                child: Text(_textoResultado, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
