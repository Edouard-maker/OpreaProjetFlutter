import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:oprea_projet_flutter/accueil.dart';
import 'package:oprea_projet_flutter/inscription.dart';

Future<void> mainDuJeu() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const GameInformation());
}

class GameInformation extends StatefulWidget {
  const GameInformation({Key? key}) : super(key: key);
  @override
  _GameInformationState createState() => _GameInformationState();
}

class _GameInformationState extends State<GameInformation> {
  final Stream<QuerySnapshot> _gameStream =
      FirebaseFirestore.instance.collection('Jeux').snapshots();

  @override
  Widget build(BuildContext context) {

    return StreamBuilder<QuerySnapshot>(
      stream: _gameStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          shrinkWrap: true,
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> game =
                document.data()! as Map<String, dynamic>;

            return Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Image.network(game['photoJeu']),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          game['nomJeu'],
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        Text("appId : " + game['steamId'].toString()),

                        Row(children: [
                          Padding(padding: const EdgeInsets.only(right: 5),
                            child: Chip(
                              backgroundColor: Colors.lightBlue,
                              label: Text(game['prixJeu'].toString() + "€"),
                            ),)
                        ],)
                      ],
                    ),
                  )
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
