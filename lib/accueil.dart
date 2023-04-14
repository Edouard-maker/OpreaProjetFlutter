import 'package:flutter/material.dart';
import 'package:oprea_projet_flutter/favoris.dart';
import 'wishlist.dart';
import 'jeu.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'infosJeux.dart';

class Game {
  final int id;
  final String nomJeu;
  final String editeurJeu;
  final double prixJeu;

  Game({
    required this.id,
    required this.nomJeu,
    required this.editeurJeu,
    required this.prixJeu,
  });

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      id: json['appid'],
      nomJeu: json['name'],
      editeurJeu: '',
      prixJeu: 0.0,
    );
  }
}
/*
Future<Game> fetchGame(int appId) async {
  final response = await http.get(
    Uri.parse('https://store.steampowered.com/api/appdetails?appids=$appId&cc=FR&l=fr'),
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> json = jsonDecode(response.body);
    final Map<String, dynamic> gameJson = json['$appId']['data'];
    return Game(
      id: gameJson['steam_appid'],
      nomJeu: gameJson['name'],
      editeurJeu: gameJson['publishers'] != null ? gameJson['publishers'].join(', ') : '',
      prixJeu: gameJson['price_overview'] != null ? double.parse(gameJson['price_overview']['final'] / 100) : 0.0,
    );
  } else {
    throw Exception('Failed to load game');
  }
}*/

class AccueilPage extends StatefulWidget {
  @override
  _AccueilPageState createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          leading: null,
          backgroundColor: Color(0xFF1A2025),
          title: Text(
            'Accueil',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => FavorisPage()));
              },
            ),
            IconButton(
              icon: Icon(
                Icons.star,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => WishlistPage()));
              },
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(1.0),
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xFF1A2025),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      onSubmitted: (value) async {
                        /*
                      int? appId = int.tryParse(value);
                      if (appId != null) {
                        Game game = await fetchGame(appId);
                      }*/
                      },
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Entrez l\'ID Steam du jeu : ',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      /*int? appId = int.tryParse(_controller.text);
                    if (appId != null) {
                      Game game = await fetchGame(appId);
                    }*/
                    },
                  ),
                ],
              ),
            ),
           /* child: SingleChildScrollView(
              child: GameInformation(),
            ),*/
          ),
          Expanded(
            child: const SingleChildScrollView(child: GameInformation()),
          ),
        ],
      ),
    );
  }
}
