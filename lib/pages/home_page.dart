import 'package:flutter/material.dart';
import 'package:taklink/pages/collections_page.dart';

class HomePage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size; // Récupère la taille de l'écran

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 20),
            homeSearchBar(), // Affiche la barre de recherche personnalisée
            Expanded(
              child: Container(
                height: size.height,
                width: size.width,
                color: const Color.fromRGBO(255, 255, 255, 0.5),
                padding: const EdgeInsets.all(15.0),
                child:
                spanDemo(), // Affiche le contenu principal de la page d'accueil
              ),
            ),
          ],
        ),
        floatingActionButton: Container(
            margin: const EdgeInsets.only(bottom: 30),
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: const Color.fromRGBO(32, 92, 207, 1),
              shape: const CircleBorder(),
              child: const Icon(Icons.add, color: Colors.white, size: 40),
            )),
      ),
    );
  }

  // Mes fonctions

  homeSearchBar() {
    return AppBar(
      title: TextField(
        controller: _controller,
        decoration: InputDecoration(
          // contentPadding: const EdgeInsets.symmetric(),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: Colors.black, width: 2),
          ),

          hintText: 'Search Job here',
          prefixIcon: Image.asset(
            'icones/magnifier.png',
            color: Colors.black,
            width: 15,
            height: 15,
          ),
          suffixIcon: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                _controller.clear();
              }),
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: Image.asset('icones/filter.png'),
          onPressed: () {},
        ),
      ],
      // backgroundColor: Colors.indigo,
    );
  }

  Text simpleText(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 15,
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
      ),
      textAlign: TextAlign.center,
    );
  }

  Column spanDemo() {
    return Column(
      children: <Widget>[
        simpleText('Salut tout le monde!'),
        simpleText('vous etes sur la page d\'accueil'),
      ],
    );
  }
}
