import 'package:flutter/material.dart';
import 'accueil.dart';

class FavorisPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: Color(0xFF1A2025),
          leading: IconButton(
            icon: Icon(
              Icons.clear,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Mes favoris',
            style: TextStyle(color: Colors.white),
          ),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/empty_likes.png',
              width: 100,
              height: 100,
            ),
            SizedBox(height: 20),
            Text(
              'Vous n\'avez pas encore liké de contenu\nCliquez sur le coeur pour en rajouter',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}