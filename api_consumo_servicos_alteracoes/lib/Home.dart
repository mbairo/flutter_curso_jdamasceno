import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _textEditingController = TextEditingController();

  List<Map<String, String>> _listaDeResultados = [];

  bool _btnClicado = false;
  bool _loading = false;
  String? cepInformado = "";
  String? logradouro;
  String? bairro;
  String? localidade;

  _functionBuscarCep() async {
    if (cepInformado == "") {
      return;
    }

    setState(() {
      _loading = true;
    });

    String url = "https://viacep.com.br/ws/${cepInformado}/json/";
    http.Response response;
    response = await http.get(Uri.parse(url));

    // transforma o texto response.body em um json e monta um MAP com chave e valor
    Map<String, dynamic> objRetorno = json.decode(response.body);

    setState(() {
      _listaDeResultados.add({
        "cep":"Cep: ${objRetorno["cep"]}", // outra forma de colocar o objRetorno
        "logradouro": "Logradouro: " + objRetorno["logradouro"],
        "bairro": "Bairro: " + objRetorno["bairro"],
        "localidade": "Localidade: " + objRetorno["localidade"],
      });
      _loading = false;
      _textEditingController.clear();
    });

    setState(() {
      cepInformado = "";
    });
    // print("Resposta statusCode: " + response.statusCode.toString());
    // print("Resposta body: " + response.body);
    //Poderia colocar todos os dados do body
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 230, 211, 105),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 230, 211, 105),
        title: Text("Busca CEP"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(labelText: "Informe o CEP"),
              keyboardType: TextInputType.number,
              onChanged: (String cepInformado) {
                this.cepInformado = cepInformado;
              },
            ),
            SizedBox(height: 10),

            ElevatedButton(
              child: Text(
                "Buscar",
                style: TextStyle(fontSize: 16),
              ),
              onPressed: () {
                setState(() {
                  _btnClicado = true;
                });
                _functionBuscarCep();
              },
            ),

            SizedBox(height: 10),
            if (_loading) CircularProgressIndicator(),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _listaDeResultados.reversed.map((item) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "${item["cep"]}\n${item["logradouro"]}\n${item["bairro"]}\n${item["localidade"]}\n----------------------------",
                    style: TextStyle(fontSize: 18),
                  ),
                );
              }).toList(),
            ),
            // if (_btnClicado == true && _loading == false)
            //   Text(" $cepInformado\n $logradouro\n $bairro\n $localidade"),
            // if (_loading == true) CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
