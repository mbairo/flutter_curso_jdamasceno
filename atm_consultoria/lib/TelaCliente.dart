import 'package:flutter/material.dart';

class TelaCliente extends StatefulWidget {
  const TelaCliente({super.key});

  @override
  State<TelaCliente> createState() => _TelaClienteState();
}

class _TelaClienteState extends State<TelaCliente> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Tela Cliente"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                
                children: [
                  Image.asset("img/detalhe_cliente.png"),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Clientes",
                      style: TextStyle(
                        color: Colors.amber[700],
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),

              // Três maneiras de se fazer
              // 1* Direto
              Image.asset("img/cliente1.png"),
              Text("Empresa de Software"),

              // 2* Utilizando Container, poderia ter sido colocado dentro todas as img e textos, separando por paddings
              Container(
                child: Column(
                  children: [
                    // Padding(padding: EdgeInsets.all(16)),
                    Image.asset("img/cliente1.png"),
                    Text("Empresa de Software"),
                  ],
                ),
              ),

              // 3* Utilizando Padding
              Image.asset("img/cliente2.png"),
              Padding(
                padding: EdgeInsets.all(16),
                child: Text("Empresa de auditoria"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
