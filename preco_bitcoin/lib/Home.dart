import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _btcEmRealAtualizadoBuy = "";
  String _btcEmRealAtualizadoLast = "";

  void _functionAtualizarValor() async {
    String url = "https://blockchain.info/ticker";
    http.Response response = await http.get(Uri.parse(url));

    Map<String, dynamic> objJsonRetorno = json.decode(response.body);
    String _btcEmReal = objJsonRetorno["BRL"]["buy"].toString();
    String _btcEmRealLast = objJsonRetorno["BRL"]["last"].toString();

    print(">>>>>>>>>>>>>>>>>>>>>" + objJsonRetorno.toString());
    print("-----------");
    print(">>>>>>>>>>>>>>>>>>>>> Preço Em RERAL: ${_btcEmReal}");

    setState(() {
      this._btcEmRealAtualizadoBuy = _btcEmReal;
      this._btcEmRealAtualizadoLast = _btcEmRealLast;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        body: Container(
          padding: EdgeInsets.all(32),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/img/bitcoin.png"),
                SizedBox(
                  height: 20,
                ),
                Text("(BUY) R\$" + this._btcEmRealAtualizadoBuy),
                SizedBox(
                  height: 10,
                ),
                Text("(LAST) R\$" + this._btcEmRealAtualizadoLast),
                SizedBox(
                  height: 10,
                ),
                
                ElevatedButton(
                  // Cor do botão
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      Colors.orange,
                    ),
                  ),
                  child: Text(
                    "Atualizar",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),

                  onPressed: _functionAtualizarValor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
