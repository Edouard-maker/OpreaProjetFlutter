import 'package:flutter/material.dart';
import 'accueil.dart';

class WishlistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Ma liste de souhaits'),
      ),
      body: Center(
        child: Text('Vous n avez pas encore liké de contenu \n Cliquez sur l étoile pour en rajouter'),
      ),
    );
  }
}
