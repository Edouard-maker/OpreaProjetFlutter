import 'dart:convert';
import 'package:http/http.dart' as http;

class Game {
  final int appId;
  final String nomJeu;
  final String editeurJeu;
  final double prixJeu;
  final String imageUrl;

  Game(
      {required this.appId,
      required this.nomJeu,
      required this.editeurJeu,
      required this.prixJeu,
      required this.imageUrl});

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      appId: json['appid'],
      nomJeu: json['name'],
      editeurJeu: json['publisher'],
      imageUrl: json['header_image'],
      prixJeu: json['price_overview']['initial'] / 100,
    );
  }
}

Future<List<Game>> getTopGames() async {
  final apiKey = '8B87358D89172DB1EB993B9F52BDC5BD';
  final url = Uri.parse(
      'https://api.steampowered.com/ISteamApps/GetTopSellingApps/v1/?key=$apiKey&format=json');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body)['response']['games'];
    final List<Game> games = [];
    for (var gameData in data) {
      final game = Game.fromJson(gameData);
      games.add(game);
    }
    return games;
  } else {
    throw Exception('Failed to load top games');
  }
}
