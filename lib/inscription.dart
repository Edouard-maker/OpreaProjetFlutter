import 'dart:math';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class InscriptionPage extends StatefulWidget {
  const InscriptionPage({Key? key}) : super(key: key);

  @override
  State<InscriptionPage> createState() => _InscriptionPageState();
}

class _InscriptionPageState extends State<InscriptionPage> {

  final loginController = TextEditingController();
  final mdpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Inscription"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              /// Début saisie Login
              ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                  side: const BorderSide(color: Colors.white30, width: 1.5),
                ),
                title: Row(
                  children: [
                    Text("Login : "),
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        controller: loginController,
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// Début saisie mdp
              ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                  side: const BorderSide(color: Colors.white30, width: 1.5),
                ),
                title: Row(
                  children: [
                    Text("Mdp : "),
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        controller: mdpController,
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                  ),
                  onPressed: () {
                    FirebaseFirestore.instance.collection('Mdp').add({
                      'login': loginController.value.text,
                      'mdp': mdpController.value.text,
                    });
                  }, child: const Text("Créer compte"))

            ],
          ),
        ));
  }
}
