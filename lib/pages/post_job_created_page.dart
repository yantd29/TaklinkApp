import 'package:flutter/material.dart'; // Importation du package flutter/material.dart pour utiliser les widgets de Flutter
import '../main.dart'; // Importation du fichier main.dart (peut-être le point d'entrée de l'application)

class postJobCreatedPage extends StatelessWidget {
  // Définition d'une classe postJobCreated qui étend StatelessWidget
  final String
      titrePoste; // Déclaration d'une variable titrePoste de type String
  final int
      postesVacants; // Déclaration d'une variable postesVacants de type int
  final double
      salaireMinimal; // Déclaration d'une variable salaireMinimal de type double
  final double
      salaireMaximal; // Déclaration d'une variable salaireMaximal de type double
  final bool tempsPlein; // Déclaration d'une variable tempsPlein de type bool
  final bool
      tempsPartiel; // Déclaration d'une variable tempsPartiel de type bool

  const postJobCreatedPage(
      {Key? key,
      required this.titrePoste,
      required this.postesVacants,
      required this.salaireMinimal,
      required this.salaireMaximal,
      required this.tempsPlein,
      required this.tempsPartiel})
      : super(key: key); // Constructeur de la classe postJobCreated

  @override
  Widget build(BuildContext context) {
    // Méthode build qui retourne un widget
    var size =
        MediaQuery.of(context).size; // Récupération de la taille de l'écran
    double progressDouble =
        1; // Déclaration d'une variable progressDouble de type double initialisée à 1
    String tempsPleinStr = tempsPlein
        ? 'Temps plein'
        : ''; // Déclaration d'une variable tempsPleinStr de type String qui contient 'Temps plein' si tempsPlein est vrai, sinon une chaîne vide
    String tempsPartielStr = tempsPartiel
        ? 'Temps partiel'
        : ''; // Déclaration d'une variable tempsPartielStr de type String qui contient 'Temps partiel' si tempsPartiel est vrai, sinon une chaîne vide

    return GestureDetector(
      // Utilisation du widget GestureDetector pour détecter les gestes de l'utilisateur
      onTap: () {
        FocusScope.of(context)
            .unfocus(); // Ferme le clavier virtuel lorsque l'utilisateur tape à l'extérieur d'un champ de texte
      },
      child: Scaffold(
        // Utilisation du widget Scaffold pour créer une structure de base de l'interface utilisateur
        body: Column(
          // Utilisation du widget Column pour organiser les widgets en colonne
          children: [
            jobAppBar(
                context), // Appel de la fonction jobAppBar avec le contexte en paramètre
            jobProgressBar(
                progressDouble), // Appel de la fonction jobProgressBar avec progressDouble en paramètre
            Expanded(
              // Utilisation du widget Expanded pour occuper tout l'espace disponible
              child: Container(
                // Utilisation du widget Container pour créer un conteneur avec des propriétés personnalisées
                height: size
                    .height, // Définition de la hauteur du conteneur en fonction de la taille de l'écran
                width: size
                    .width, // Définition de la largeur du conteneur en fonction de la taille de l'écran
                color: const Color.fromRGBO(255, 255, 255,
                    0.5), // Définition de la couleur de fond du conteneur
                padding: const EdgeInsets.only(
                    top: 50.0,
                    left: 15.0,
                    right: 15,
                    bottom:
                        15), // Définition des marges intérieures du conteneur
                child: ListView(
                  // Utilisation du widget ListView pour afficher une liste de widgets
                  children: <Widget>[
                    ListTile(
                      // Utilisation du widget ListTile pour afficher une ligne d'éléments dans la liste
                      leading: const Icon(Icons
                          .circle), // Affichage d'une icône en tant que préfixe de la ligne
                      title: Text(
                          'Titre du poste : $titrePoste'), // Affichage du titre du poste
                    ),
                    ListTile(
                      leading: const Icon(Icons.circle),
                      title: Text(
                          'Postes vacants : $postesVacants postes'), // Affichage du nombre de postes vacants
                    ),
                    ListTile(
                      leading: const Icon(Icons.circle),
                      title: Text(
                          'Salaire par heure: $salaireMinimal \$ à $salaireMaximal \$'), // Affichage de la plage salariale
                    ),
                    ListTile(
                      leading: const Icon(Icons.circle),
                      title: Text(
                          'Type de travail : ${tempsPlein && tempsPartiel ? '$tempsPleinStr/$tempsPartielStr' : tempsPlein ? tempsPleinStr : tempsPartielStr}'), // Affichage du type de travail (temps plein, temps partiel)
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          // Utilisation du widget BottomAppBar pour afficher une barre de navigation en bas de l'écran
          color: const Color.fromRGBO(255, 255, 255,
              0.5), // Définition de la couleur de fond de la barre de navigation
          child: Padding(
            padding: const EdgeInsets.all(
                8.0), // Définition des marges intérieures de la barre de navigation
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context); // Retourne à la page précédente
                  },
                  icon: Image.asset(
                    'icones/previous.png',
                    color: Colors.black,
                  ),
                ),
                Container(
                  width: 150,
                  child: TextButton.icon(
                    onPressed: () {
                      // Ajoutez votre logique de sauvegarde ici...
                    },
                    icon: Image.asset('icones/post.png',
                        width: 20, height: 20, color: Colors.white),
                    label: const Text('Post',
                        style: TextStyle(
                            color: Colors
                                .white)), // Ici, nous définissons la couleur du texte en blanc
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(32, 92, 207,
                          1), // Ici, nous définissons la couleur de fond en bleu
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Mes fonctions
  jobAppBar(BuildContext context) {
    // Définition de la fonction jobAppBar avec le contexte en paramètre
    return AppBar(
      // Utilisation du widget AppBar pour afficher une barre d'application en haut de l'écran
      title: titreOngletText('Create Job'), // Affichage du titre de l'onglet
      backgroundColor: const Color.fromRGBO(32, 92, 207,
          1), // Définition de la couleur de fond de la barre d'application
      leading: IconButton(
        icon: const Icon(Icons.arrow_back,
            color: Colors.white), // Affichage d'une icône de flèche en arrière
        onPressed: () {
          Navigator.pop(
              context); // Retourne à la page précédente en utilisant le contexte en paramètre
        },
      ),

      // Ajoute un bouton à droite pour retourner à la page d'accueil
      actions: <Widget>[
        IconButton(
          icon: Image.asset('icones/home2.png',
              width: 20,
              height: 20,
              color: Colors.white), // Affichage d'une icône de maison
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      MyApp()), // Redirige vers la page d'accueil
              (Route<dynamic> route) => false,
            );
          },
        ),
      ],
    );
  }

  jobProgressBar(double progress) {
    // Définition de la fonction jobProgressBar avec progress en paramètre
    return LinearProgressIndicator(
      // Utilisation du widget LinearProgressIndicator pour afficher une barre de progression linéaire
      value: progress, // Définition de la valeur de progression
      backgroundColor: Colors
          .grey, // Définition de la couleur de fond de la barre de progression
      valueColor: const AlwaysStoppedAnimation<Color>(
          Colors.blue), // Définition de la couleur de la barre de progression
    );
  }

  Text titreOngletText(String text) {
    // Définition de la fonction titreOngletText avec text en paramètre
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
}
