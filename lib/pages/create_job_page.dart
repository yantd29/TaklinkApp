import 'package:flutter/material.dart';
import 'package:taklink/pages/post_job_created_page.dart';

class CreateJobPage extends StatefulWidget {
  const CreateJobPage({super.key});

  @override
  _CreateJobPageState createState() => _CreateJobPageState();
}

class _CreateJobPageState extends State<CreateJobPage> {
  final _formKey = GlobalKey<FormState>();
  String? validationMessage; // Variable pour stocker le message d'erreur

  final titrePosteController = TextEditingController();
  final postesVacantsController = TextEditingController();
  final typeTravailController = TextEditingController();
  final salaireMinimalController = TextEditingController();
  final salaireMaximalController = TextEditingController();
  bool estTempsPlein = false;
  bool estTempsPartiel = false;

  @override
  void dispose() {
    // Nettoyez les contrôleurs lorsque le widget est supprimé.
    titrePosteController.dispose();
    postesVacantsController.dispose();
    typeTravailController.dispose();
    salaireMinimalController.dispose();
    salaireMaximalController.dispose();
    super.dispose();
  }

  // Méthode pour vérifier si au moins une option est sélectionnée
  void validateSelection() {
    if (!estTempsPlein && !estTempsPartiel) {
      setState(() {
        validationMessage =
        "Veuillez sélectionner au moins une option de temps de travail.";
      });
    } else {
      setState(() {
        validationMessage =
        null; // Aucune erreur si une option est sélectionnée
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double progressDouble = 1 / 2;
    // DateTime dateCreationPoste = DateTime.now();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Column(
          children: [
            jobAppBar(context),
            jobProgressBar(progressDouble),
            Expanded(
              child: Container(
                width: size.width,
                color: const Color.fromRGBO(255, 255, 255, 0.5),
                padding: const EdgeInsets.only(
                    top: 50.0, left: 15.0, right: 15, bottom: 15),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Titre du poste :',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500)),
                        ),

                        const SizedBox(height: 4),

                        TextFormField(
                          controller: titrePosteController,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Titre du job',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.0,
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 0),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '\n\nentrer un titre de poste';
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 30), // Add this line

                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Postes vacants :',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500)),
                        ),
                        const SizedBox(height: 4),

                        TextFormField(
                          controller: postesVacantsController,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: false),
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Nombre de candidats',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.0,
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 0),
                          ),

                          // validation du champ

                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '\n\nentrer le nombre de postes vacants';
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 30), // Add this line

                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Salaire du poste par heure:',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500)),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Min : ',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400)),
                            SizedBox(
                              width: 100,
                              height: 30,
                              child: TextFormField(
                                controller: salaireMinimalController,
                                keyboardType:
                                const TextInputType.numberWithOptions(
                                    decimal: true),
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Minimum',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14.0,
                                  ),
                                  contentPadding:
                                  EdgeInsets.symmetric(vertical: 0),
                                ),

                                // validation du champ
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Veuillez entrer le salaire minimal';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Text('Max : ',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400)),
                            SizedBox(
                              width: 100,
                              height: 35,
                              child: TextFormField(
                                controller: salaireMaximalController,
                                keyboardType:
                                const TextInputType.numberWithOptions(
                                    decimal: true),
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Maximum',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14.0,
                                  ),
                                  contentPadding:
                                  EdgeInsets.symmetric(vertical: 0),
                                ),

                                // validation du champ
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Veuillez entrer le salaire maximal';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(width: 10),
                          ],
                        ),

                        // Entrer du type de travail
                        const SizedBox(height: 30), // Add this line

                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Type de travail:',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500)),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: CheckboxListTile(
                                title: const Text("Temps plein",
                                    style: TextStyle(fontSize: 13)),
                                value: estTempsPlein,
                                onChanged: (bool? value) {
                                  setState(() {
                                    estTempsPlein = value!;
                                  });
                                },
                                controlAffinity: ListTileControlAffinity
                                    .leading, //  places the checkbox at the start
                              ),
                            ),
                            Expanded(
                              child: CheckboxListTile(
                                title: const Text("Temps partiel",
                                    style: TextStyle(fontSize: 13)),
                                value: estTempsPartiel,
                                onChanged: (bool? value) {
                                  setState(() {
                                    estTempsPartiel = value!;
                                  });
                                },
                                controlAffinity: ListTileControlAffinity
                                    .leading, //  places the checkbox at the start
                              ),
                            ),
                          ],
                        ),
                        // Affiche le message d'erreur
                        if (validationMessage != null)
                          Text(
                            validationMessage!,
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: const Color.fromRGBO(255, 255, 255, 0.5),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Image.asset(
                        'icones/save.png',
                        color: Colors.black,
                      ),
                      onPressed: () {},
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Save and',
                            style: TextStyle(
                              color: Colors.black,
                            )),
                        Text('continue later',
                            style: TextStyle(color: Colors.black)),
                      ],
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   const SnackBar(
                      //       content: Text(
                      //           'Envoi en cours...')), // Affiche un message de confirmation
                      // );

                      FocusScope.of(context)
                          .requestFocus(FocusNode()); // Ferme le clavier

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => postJobCreatedPage(
                            titrePoste: titrePosteController.text,
                            postesVacants:
                            int.parse(postesVacantsController.text),
                            salaireMinimal:
                            double.parse(salaireMinimalController.text),
                            salaireMaximal:
                            double.parse(salaireMaximalController.text),
                            tempsPlein: estTempsPlein,
                            tempsPartiel: estTempsPartiel,
                          ),
                        ),
                      );
                    }

                    if (validationMessage != null)
                      Text(
                        validationMessage!,
                        style: const TextStyle(color: Colors.red, fontSize: 12),
                      );
                  },
                  icon: Image.asset(
                    'icones/next.png',
                    color: Colors.black,
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
    // Add the BuildContext parameter
    return AppBar(
      title: titreOngletText('Create Job'),
      backgroundColor: const Color.fromRGBO(32, 92, 207, 1),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          // retourne a la page d'accueil
          Navigator.pop(context); // Use the context parameter
        },
      ),

      // ajoute un bouton a droite pour retourner a la page d'accueil
      actions: <Widget>[
        IconButton(
          icon: Image.asset('icones/home2.png',
              width: 20, height: 20, color: Colors.white),
          onPressed: () {
            // retourne a la page d'accueil
            Navigator.pop(context); // Use the context parameter
          },
        ),
      ],
    );
  }

  jobProgressBar(double progress) {
    return LinearProgressIndicator(
      value: progress,
      backgroundColor: Colors.grey,
      valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
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
}
