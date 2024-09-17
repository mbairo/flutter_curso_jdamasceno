import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:youtube_s/model/Video.dart'; // Para poder utilizar o json

const CHAVE_YOUTUBE_API = "AIzaSyBbiHPIcaccUUprkLvkew0vkPBa5_KS0kM";
const ID_CANAL = "UCVHFbqXqoYvEWM1Ddxl0QDg";
const URL_BASE = "www.googleapis.com";

class Api {
  Future<List<Video>>pesquisar(String pesquisa) async {
    final queryParameters = {
      'part': 'snippet',
      'type': 'video',
      'maxResults': '20',
      'order': 'date',
      'key': CHAVE_YOUTUBE_API,
      'channelId': ID_CANAL,
      'q': pesquisa
    };

    final uri = Uri.https(URL_BASE, '/youtube/v3/search', queryParameters);

    http.Response response = await http.get(uri);

    // Saíca completa
    // if (response.statusCode == 200) {
    //   print("Resultado: " + response.body);
    // } else {
    //   print("Erro: " + response.statusCode.toString());
    // }

    // Mostrar apenas o totalResults e resultsPerPage
    // if (response.statusCode == 200) {
    //   Map<String, dynamic> dadosJson = json.decode(response.body);
    //   print("Resultado: " + dadosJson["pageInfo"].toString());
    // } else {
    //   print("Erro: " + response.statusCode.toString());
    // }

    // Todos os 'items'
    // if (response.statusCode == 200) {
    //   Map<String, dynamic> dadosJson = json.decode(response.body);
    //   print("Resultado: " + dadosJson["items"].toString());
    // } else {
    //   print("Erro: " + response.statusCode.toString());
    // }

    // Apenas o videoId
    // if (response.statusCode == 200) {
    //   Map<String, dynamic> dadosJson = json.decode(response.body);
    //   print("Resultado: " + dadosJson["items"][0]["id"]["videoId"].toString()); // Pega o items/0/id/videoId
    // } else {
    //   print("Erro: " + response.statusCode.toString());
    // }

    // Apenas o "description" do video
    // if (response.statusCode == 200) {
    //   Map<String, dynamic> dadosJson = json.decode(response.body);
    //   print("Resultado: " + dadosJson["items"][0]["snippet"]["description"].toString());
    // } else {
    //   print("Erro: " + response.statusCode.toString());
    // }

    // Criando variáveis para armazenar título e descrição
    // if (response.statusCode == 200) {
    //   Map<String, dynamic> dadosJson = json.decode(response.body);
    //   String titulo = dadosJson["items"][0]["snippet"]["title"].toString();
    //   String descricao =dadosJson["items"][0]["snippet"]["description"].toString();
    //   print("Título: " + titulo + "\nDescrição: " + descricao);
    // } else {
    //   print("Erro: " + response.statusCode.toString());
    // }

    if (response.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(response.body);
      // o Map ira retornar obj do tipo Video, percorrendo toda a lista de items qu estão dentro de 'dados.Json["items"]'
      List<Video> videos = (dadosJson["items"] as List).map<Video>(
          //Função anonima que recebe como parametro 'map' que é o obj video
          (map) {
        return Video.fromJson(map);
        // return Video.converterJson(map);
      }).toList();
      // for (var video in videos) {
      //   print (video.titulo);
      // }

      // for (var video in dadosJson["items"]) {
      //   print("Resultado: " + video["snippet"]["title"].toString());
      // }

      // print("Título: " + dadosJson["items"][0]["snippet"]["title"].toString());
      return videos;
    } else {
      print("Erro: " + response.statusCode.toString());
      return [];
    }
  }
}
