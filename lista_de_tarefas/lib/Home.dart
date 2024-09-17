import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _listaDeTarefas = [];
  Map<String, dynamic> _ultimaTarefaRemovida = Map();

  TextEditingController _controllerTarefa = TextEditingController();

  Future<File> _getFile() async {
    final diretorio = await getApplicationCacheDirectory();
    return File("{$diretorio.path}/dados.json");
  }

  _salvarTarefa() {
    String textoDigitado = _controllerTarefa.text;

    Map<String, dynamic> tarefa = Map();
    tarefa["titulo"] = textoDigitado;
    tarefa["realizada"] = false;

    setState(() {
      _listaDeTarefas.add(tarefa);
    });
    _salvarArquivo();
    _controllerTarefa.text = ""; // Para zerar o campo do último preenchimento
  }

  _salvarArquivo() async {
    var arquivo = await _getFile();

    String dados = json.encode(_listaDeTarefas);
    arquivo.writeAsString(dados);
  }

  _lerArquivo() async {
    try {
      final arquivo = await _getFile();
      return arquivo.readAsString();
    } catch (e) {
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    _lerArquivo().then((dados) {
      setState(() {
        _listaDeTarefas = json.decode(dados);
      });
    });
  }

  Widget criarItemLista(context, index) {
    return Dismissible(
      key: Key(DateTime.now()
          .millisecondsSinceEpoch
          .toString()), // Para poder criar uma key diferente. Não e aceito recolocar a mesma.
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        _ultimaTarefaRemovida = _listaDeTarefas[index];

        _listaDeTarefas.removeAt(index);
        _salvarArquivo();

        final snackBar = SnackBar(
          // backgroundColor: Colors.green,
          duration: Duration(seconds: 15),
          content: Text("Tarefa removida!!!"),
          action: SnackBarAction(
              label: "Desfazer",
              onPressed: () {
                setState(() {
                  // Insere novamente o item removido da lista, na mesma posição.
                  _listaDeTarefas.insert(index, _ultimaTarefaRemovida);
                });
                _salvarArquivo();
              }),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      background: Container(
        color: Colors.red,
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.delete,
              color: Colors.white,
            )
          ],
        ),
      ),
      child: CheckboxListTile(
        title: Text(_listaDeTarefas[index]['titulo']),
        value: _listaDeTarefas[index]['realizada'],
        onChanged: (valorAlterado) {
          setState(() {
            _listaDeTarefas[index]['realizada'] = valorAlterado;
          });
          _salvarArquivo();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Tarefas"),
        backgroundColor: Colors.purple,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: Colors.purple,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              
              
              
              return AlertDialog(
                title: Text("Adicionar Tarefa"),
                content: TextField(
                  controller: _controllerTarefa,
                  decoration: InputDecoration(labelText: "Digite sua tarefa"),
                  // onChanged: (textx) {},
                ),
                actions: [
                  ElevatedButton(
                    child: Text("Cancelar"),
                    onPressed: () => Navigator.pop(context),
                  ),
                  ElevatedButton(
                    child: Text("Salvar"),
                    onPressed: () {
                      _salvarTarefa();
                      Navigator.pop(context);
                    },
                  )
                ],
              );



              
            },
          );
        },
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: _listaDeTarefas.length,
            itemBuilder: criarItemLista,
          ))
        ],
      ),
    );
  }
}
