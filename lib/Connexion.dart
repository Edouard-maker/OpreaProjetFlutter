import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(AppDebut());

class AppDebut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _loginController,
                decoration: InputDecoration(
                  hintText: 'Login',
                ),
                validator: (value) {
                  if (value!= null && value.isEmpty) {
                    return 'Veuillez saisir un login';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Mot de passe',
                ),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Veuillez saisir un mot de passe';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              _isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                child: Text('Se connecter'),
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    setState(() {
                      _isLoading = true;
                    });

                    String login = _loginController.text.trim();
                    String password = _passwordController.text.trim();

                    // On vérifie les infos de connexion
                    try {
                      await verifyLogin(login, password);
                    } catch (e) {
                      print('Erreur : $e');
                    } finally {
                      setState(() {
                        _isLoading = false;
                      });
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Fonction pour vérifier les champs de connexion
  Future<void> verifyLogin(String login, String password) async {
    // Accéder à la collection "Mdp" de Firestore
    CollectionReference mdpCollection = FirebaseFirestore.instance.collection('Mdp');

    // Récupérer le document correspondant au login saisi
    QuerySnapshot querySnapshot = await mdpCollection.where('login', isEqualTo: login).get();

    // Si aucun document ne correspond au login saisi, afficher un message d'erreur
    if (querySnapshot.docs.isEmpty) {
      print('Login incorrect');
      throw ('Login incorrect');
    }

    // Récupérer le premier document (il ne devrait y en avoir qu'un)
    QueryDocumentSnapshot documentSnapshot = querySnapshot.docs.first;

    // Vérifier que le mot de passe saisi correspond au mot de passe stocké dans Firestore
    String storedPassword = documentSnapshot.get('mdp');
    if (password == storedPassword) {
      print('Connexion réussie');
    } else {
      print('Mot de passe incorrect');
      throw ('Mot de passe incorrect');
    }
  }
}
