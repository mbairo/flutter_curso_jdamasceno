import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _listaDeItens = [];

  void _carregarItens() {
    for (var i = 0; i <= 20; i++) {
      Map<String, dynamic> mapItem = Map();
      mapItem["titulo"] = "Título ${i} Lorem ipsum dolor sit amet.";
      mapItem["descricao"] = "Descrição ${i} Lorem ipsum dolor sit amet.";
      this._listaDeItens.add(mapItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    _carregarItens();

    return Scaffold(
      appBar: AppBar(
        title: Text("Lista"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
            itemCount: _listaDeItens.length,
            itemBuilder: (context, indice) {
              // Map<String, dynamic> item = _listaDeItens[indice];
              // print("Item: ${item["titulo"]}");

              return ListTile(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(this._listaDeItens[indice]["titulo"]),
                          titlePadding: EdgeInsets.all(20),
                          titleTextStyle:
                              TextStyle(fontSize: 20, color: Colors.orange),
                          // contentPadding: EdgeInsets.all(80), // Cria um espaço em volta da palavra dentro do bloco
                          content:
                              Text(this._listaDeItens[indice]["descricao"]),
                          backgroundColor: Colors.blue,
                          actions: <Widget>[
                            ElevatedButton(
                                child: Text("Sim"),
                                onPressed: () { // poderia ser feito uma função para remover o item ou editar
                                  print("Selecionado o item $indice");
                                  Navigator.pop(context);
                                }),
                            ElevatedButton(
                                child: Text("Não"),
                                onPressed: () {
                                  print("Selecionado o NÃO");
                                  Navigator.pop(context);
                                }),
                          ],
                        );
                      });
                },
                // onLongPress: () {
                //   print("Clique com onLongTap ${indice}");
                // },
                title: Text(
                  this._listaDeItens[indice]["titulo"],
                ),
                subtitle: Text(this._listaDeItens[indice]["descricao"]),
              );
            }),
      ),
    );
  }
}
