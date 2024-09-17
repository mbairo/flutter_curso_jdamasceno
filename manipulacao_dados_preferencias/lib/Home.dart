import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerCampo = TextEditingController();
  String _textoSalvo = "Nada salvo!";

  _salvar() async {
    String valorDigitado = _controllerCampo.text;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("nome", valorDigitado);
    print(">>>>>>>>>>>>> Salvar: $_textoSalvo");

    setState(() {
      _textoSalvo = valorDigitado;
    });
  }

  _recuperar() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      _textoSalvo = prefs.getString("nome") ?? "Sem valor";
    });
    print(">>>>>>>>>>>>> Recuperar: $_textoSalvo");
  }

  _remover() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("nome");
    print(">>>>>>>>>>>>> Removido");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              _textoSalvo,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Digite algo"),
              controller: _controllerCampo,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero, // botão retangular
                      ),
                      padding: EdgeInsets.all(15)),
                  child: Text(
                    "Salvar",
                    style: TextStyle(fontSize: 15),
                  ),
                  onPressed: _salvar,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero, // botão retangular
                      ),
                      padding: EdgeInsets.all(15)),
                  child: Text(
                    "Recuperar",
                    style: TextStyle(fontSize: 15),
                  ),
                  onPressed: _recuperar,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero, // botão retangular
                      ),
                      padding: EdgeInsets.all(15)),
                  child: Text(
                    "Remover",
                    style: TextStyle(fontSize: 15),
                  ),
                  onPressed: _remover,
                ),
                // Text(_textoSalvo),
              ],
            )
          ],
        ),
      ),
    );
  }
}
