import 'package:flutter/material.dart';
import 'package:youtube_s/Api.dart';
import 'package:youtube_s/Api.dart';
import 'package:youtube_s/model/Video.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
// import 'package:flutter_youtube/flutter_youtube.dart';

class Inicio extends StatefulWidget {
  // const Inicio({super.key});

  String pesquisa;

  Inicio(this.pesquisa);

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  _listarVideos(String pesquisa) {
    Api api = Api();
    return api.pesquisar(pesquisa);
  }

  @override
  void initState() {
    super.initState();
    print("Chamado 1 - initState");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("Chamado 2 - didChangeDependencies");
  }

  @override
  void didUpdateWidget(covariant Inicio oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("Chamado 2 - didUpdateWidget");
  }

  @override // descarta processos não utilizados, por exemplo da tela anterior
  void dispose() {
    super.dispose();
    print("Chamado 4 - Dispose");
  }

  @override
  Widget build(BuildContext context) {
    print("Chamado 3 - Build");

    return FutureBuilder<List<Video>>(
      future: _listarVideos(widget.pesquisa),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
            break;
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasData) {
              return ListView.separated(
                  itemBuilder: (context, index) {
                    List<Video>? videos = snapshot.data;
                    Video video = videos![index];

                    return GestureDetector(
                      onTap: () {
                        // Erro: FlutterYoutube. ... descontinuado
                        // FlutterYoutube.playYoutubeVideoById(
                        //   apikey: CHAVE_YOUTUBE_API,
                        //   videoId: video.id,
                        //   autoPlay: true,
                        // );
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(video.imagem
                                        .toString()))), // Dando erro em video.imagem
                          ),
                          ListTile(
                            title: Text(video.titulo.toString()),
                            subtitle: Text(video.descricao.toString()),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                        height: 2,
                        color: Colors.grey,
                      ),
                  itemCount: snapshot.data.toString().length);
            } else {
              return Center(
                child: Text("Nenhum dado a ser exibido!"),
              );
            }
            break;
        }
      },
    );
  }
}
