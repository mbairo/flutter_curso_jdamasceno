import 'package:flutter/material.dart';
import 'package:youtube_s/CustomSearchDelegate.dart';
import 'package:youtube_s/telas/Biblioteca.dart';
import 'package:youtube_s/telas/EmAlta.dart';
import 'package:youtube_s/telas/Inicio.dart';
import 'package:youtube_s/telas/Inscricoes.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indiceAtual = 0;
  String _resultado = "";

  @override
  Widget build(BuildContext context) {
    
    List telas = [Inicio(_resultado), EmAlta(), Inscricoes(), Biblioteca()];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        //Alterar a cor do icon
        // iconTheme: IconThemeData(
        //   color: Colors.grey,
        //   opacity: 0.5
        // ),
        title: Image.asset(
          "imagens/youtube.png",
          width: 98,
          height: 22,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              String res = await showSearch(
                  context: context, delegate: CustomSearchDelegate()).toString();
              setState(() {
                _resultado = res;
              });

              print("Resultado: digitado " + res);
            },
          )

          /*
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: () {
              print("Acao: videocam");
            },
          ),
 
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              print("Acao: conta");
            },
          ),
        */
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (_indiceClicado) {
          setState(() {
            _indiceAtual = _indiceClicado;
          });
        },
        fixedColor: Colors.red,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            label: "Início",
            icon: Icon(Icons.home),
            //backgroundColor: Colors.orange
          ),
          BottomNavigationBarItem(
            label: "Em alta",
            icon: Icon(Icons.whatshot),
            //backgroundColor: Colors.red
          ),
          BottomNavigationBarItem(
            label: "Inscrições",
            icon: Icon(Icons.subscriptions),
            //backgroundColor: Colors.blue
          ),
          BottomNavigationBarItem(
            label: "Biblioteca",
            icon: Icon(Icons.folder),
            //backgroundColor: Colors.green
          ),
        ],
      ),
    );
  }
}
