import 'package:atm_consultoria/TelaCliente.dart';
import 'package:atm_consultoria/TelaContato.dart';
import 'package:atm_consultoria/TelaEmpresa.dart';
import 'package:atm_consultoria/TelaServico.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String? _irPara(String abaClicada) {
    switch (abaClicada) {
      case "empresa":
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => TelaEmpresa()));
        break;
      case "sevicos":
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => TelaServico()));
        break;
      case "clientes":
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => TelaCliente()));
        break;
      case "contato":
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => TelaContato()));
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("ATM Consultoria"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "img/logo.png",
            ),
            Padding(
              padding: EdgeInsets.only(top: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child: Image.asset("img/menu_empresa.png"),
                    onTap: () => _irPara("empresa"),
                  ),
                  GestureDetector(
                    child: Image.asset("img/menu_servico.png"),
                    onTap: () => _irPara("sevicos"),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child: Image.asset("img/menu_cliente.png"),
                    onTap: () => _irPara("clientes"),
                  ),
                  GestureDetector(
                    child: Image.asset("img/menu_contato.png"),
                    onTap: () => _irPara("contato"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
