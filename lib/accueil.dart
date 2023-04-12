import 'package:flutter/material.dart';
import 'package:oprea_projet_flutter/favoris.dart';
import 'wishlist.dart';
import 'jeu.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AccueilPage extends StatefulWidget {
  @override
  _AccueilPageState createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      backgroundColor: Color(0xFF1A2025),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Rechercher un jeu...',
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    // Action à effectuer lorsque l'utilisateur appuie sur l'icône de recherche
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),

        ],
      ),
    );
  }
}
