import 'package:flutter/material.dart';
import 'package:taklink/pages/collections_page.dart';
import 'package:taklink/pages/employees_page.dart';
import 'package:taklink/pages/home_page.dart';
import 'package:taklink/pages/interviews_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  setCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: mainAppBar(_currentIndex),
          body: [
            HomePage(),
            const CollectionsPage(),
            const InterviewsPage(),
            const EmployeesPage()
          ][_currentIndex], // Affiche la page correspondant à l'index actuel
          bottomNavigationBar: BottomNavigationBar(
            elevation: 30,
            type: BottomNavigationBarType
                .fixed, // Définit le type de la barre de navigation en bas de l'écran
            currentIndex: _currentIndex, // Index de la page actuelle
            onTap: (index) => setCurrentIndex(
                index), // Appelé lorsque l'utilisateur appuie sur un élément de la barre de navigation
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Image.asset('icones/home2.png',
                    color: Colors.black), // Icône de la page d'accueil
                label: 'Home', // Libellé de la page d'accueil
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'icones/collection.png',
                  color: Colors.black,
                ),
                label: 'Collection', // Libellé de la page des collections
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'icones/interviews.png',
                  color: Colors.black,
                ),
                label: 'Interviews', // Libellé de la page des entretiens
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'icones/workers.png',
                  color: Colors.black,
                ),
                label: 'Employees', // Libellé de la page des employés
              ),
            ],

            unselectedItemColor:
                Colors.black, // Couleur des éléments non sélectionnés
            unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 11), // Style du libellé des éléments non sélectionnés
            selectedItemColor: const Color.fromRGBO(
                32, 92, 207, 1), // Couleur de l'élément sélectionné
            selectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12), // Style du libellé de l'élément sélectionné
            backgroundColor: const Color.fromRGBO(
                244, 244, 244, 1), // Couleur de fond de la barre de navigation
          ),
        ));
  }
}

mainAppBar(int _currentIndex) {
  return AppBar(
      title: [
        titreOngletText('TAKLINK'),
        titreOngletText('My Collections'),
        titreOngletText('My Interviews'),
        titreOngletText('My Employees')
      ][_currentIndex],
      backgroundColor: const Color.fromRGBO(32, 92, 207, 1),
      actions: <Widget>[
        IconButton(
          icon: Image.asset(
            'icones/magnifier.png',
            color: Colors.white,
          ),
          color: Colors.white,
          onPressed: () {},
        ),
        IconButton(
          icon: Image.asset('icones/bell.png'),
          color: Colors.white,
          onPressed: () {},
        ),
      ],
      leading: IconButton(
        icon: const Icon(
          Icons.menu,
          size: 30,
        ),
        color: Colors.white,
        onPressed: () {},
      ));
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
