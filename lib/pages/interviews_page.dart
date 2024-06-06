import 'package:flutter/material.dart';

class InterviewsPage extends StatelessWidget {
  const InterviewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size; // Récupère la taille de l'écran

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        color: const Color.fromRGBO(255, 255, 255, 0.5),
        // margin: EdgeInsets.all(10),
        padding: const EdgeInsets.only(top: 100),
        child: spanDemo(), // Affiche une colonne de texte
      ),
    );
  }

  Text simpleText(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 15,
        color: Colors.blue,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
      ),
      textAlign: TextAlign.center,
    );
  }

  Text titreOngletText(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 24,
        color: Colors.white,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      textAlign: TextAlign.center,
    );
  }

  Column spanDemo() {
    return Column(
      children: <Widget>[
        simpleText('Salut tout le monde!'), // Affiche un texte simple
        simpleText('Vous etes sur la page des interviews'),
      ],
    );
  }
}
