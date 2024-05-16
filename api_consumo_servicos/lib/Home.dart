import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _recuperarCep() async {
    String cep = "80820590";
    String url = "https://viacep.com.br/ws/${cep}/json/";
    // String url = "https://viacep.com.br/ws/80820590/json/";
    http.Response response;

    response = await http.get(Uri.parse(url));
    // transforma o texto response.body em um json e monta um MAP com chave e valor
    Map<String, dynamic> objRetorno = json.decode(response.body);
    // print("Resposta statusCode: " + response.statusCode.toString());
    // print("Resposta body: " + response.body);
    //Poderia colocar todos os dados do body
    String logradouro = objRetorno["logradouro"];
    String bairro = objRetorno["bairro"];
    String localidade = objRetorno["localidade"];

    print(
        "Resposta:\nLocalidade: ${localidade}\nBairro: ${bairro} \nLogradouro: ${logradouro}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de serviço web"),
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            ElevatedButton(
              child: Text("Clique aqui"),
              onPressed: _recuperarCep,
            ),
          ],
        ),
      ),
    );
  }
}
