import 'package:flutter/material.dart';
import 'package:oprea_projet_flutter/favoris.dart';
import 'wishlist.dart';

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
                // Action à effectuer lorsque l'utilisateur appuie sur l'icône de l'étoile
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
          SizedBox(
              height:
                  16.0), // Ajout d'une marge de 16 pixels entre la barre de recherche et l'image
          Container(
            width: double.infinity,
            child: Stack(
              children: [
                Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/640px-Image_created_with_a_mobile_phone.png'),
                Positioned(
                  left: 16.0,
                  bottom: 16.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Titan Fall 2',
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'ce jeu est trop bien',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: () {
                          // Action à effectuer lorsque l'utilisateur appuie sur le bouton
                        },
                        child: Text('En savoir plus'),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 15,
                  right: 15,
                  height: 2 * MediaQuery.of(context).size.height / 6,
                  width: 2 * MediaQuery.of(context).size.width / 4,
                  child: Image.network(
                      'https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/61xfJLv0DJS._AC_SX385_.jpg'),
                ),
              ],
            ),
          ),

          // Autres éléments de votre page ici
        ],
      ),
    );
  }
}
