import 'package:flutter/material.dart';
import 'package:navegacao/TelaSecundaria.dart';
import 'TelaPrincipal.dart';

void main() {
  runApp(MaterialApp(
    home: TelaPrincipal(),
    initialRoute: "/",
    routes: {
      "/secundaria" :(context) => TelaSecundaria(ModalRoute.of(context)!.settings.arguments as String?),
    },
  ));
}
