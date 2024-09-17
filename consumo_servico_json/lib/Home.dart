import 'package:consumo_servico_json/Post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _urlBase = "https://jsonplaceholder.typicode.com/";
  // Post post = Post(0, 1, "", "");

  Future<List<Post>> _recuperarPostagens() async {
    http.Response response = await http.get(Uri.parse(_urlBase + "/posts"));
    var dadosJson = json.decode(response.body);

    List<Post> postagens = [];
    for (var post in dadosJson) {
      print("post: " + post["title"]);
      Post p = Post(post["userId"], post["id"], post["title"], post["body"]);
      postagens.add(p);
    }
    return postagens;
  }

  _post() async {
    Post post = new Post(120, null, "Titulo", "Corpo da postagem");

    var corpo = json.encode(post.toJson());

    http.Response response = await http.post(Uri.parse(_urlBase + "/posts"),
        headers: {"Content-type": "application/json; charset=UTF-8"},
        body: corpo);

    print("resposta: ${response.statusCode}");
    print("resposta: ${response.body}");
  }

  _put() async {
    Post post = new Post(120, null, "Titulo", "Corpo da postagem");
    var corpo = json.encode(post.toJson());

    http.Response response = await http.put(Uri.parse(_urlBase + "/posts/3"),
        headers: {"Content-type": "application/json; charset=UTF-8"},
        body: corpo);

    print("resposta: ${response.statusCode}");
    print("resposta: ${response.body}");
  }

// Patch atualiza apenas o que você deseja. Já o Put atualiza tudo.
  _patch() async {
    Post post = new Post(120, null, "Titulo", "Corpo da postagem");
    var corpo = json.encode(post.toJson());

    http.Response response = await http.patch(Uri.parse(_urlBase + "/posts/3"),
        headers: {"Content-type": "application/json; charset=UTF-8"},
        body: corpo);

    print("resposta: ${response.statusCode}");
    print("resposta: ${response.body}");
  }

  _delete() async {
    http.Response response = await http.delete(Uri.parse(_urlBase + "/posts/3"));
    print("resposta: ${response.statusCode}");
    print("resposta: ${response.body}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de serviços - Json"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                ElevatedButton(
                  child: Text("Salvar"),
                  onPressed: _post,
                ),
                ElevatedButton(
                  child: Text("Atualizar"),
                  onPressed: _patch,
                ),
                ElevatedButton(
                  child: Text("Remover"),
                  onPressed: _delete,
                ),
              ],
            ),
            Expanded(
              child: FutureBuilder<List<Post>>(
                future: _recuperarPostagens(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      print("Conexão NONE");
                      break;

                    case ConnectionState.waiting:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                      break;

                    case ConnectionState.active:
                      print("Conexão ACTIVE");
                      break;

                    case ConnectionState.done:
                      print("Conexão DONE");
                      if (snapshot.hasError) {
                        print("Lista: erro ao carregar");
                      } else {
                        print("Lista: carregou!!!");
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              List<Post> lista = snapshot.data ?? [];
                              Post post = lista[index];

                              return ListTile(
                                title: Text(post.id.toString()),
                                subtitle: Text(post.title ?? ""),
                              );
                            });
                      }
                      break;
                  }
                  return widget;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
