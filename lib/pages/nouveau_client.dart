import 'package:couture_manager/model/client.dart';
import 'package:flutter/material.dart';

enum GenreClient { homme, femme }

class NouveauClient extends StatefulWidget {
  static const routeName = 'newClient';

  @override
  _NouveauClientState createState() => _NouveauClientState();
}

class _NouveauClientState extends State<NouveauClient> {
  final _controllernom = TextEditingController();
  final _controllerprenom = TextEditingController();
  final _controllertelephone = TextEditingController();
  final _controllertourPoitrine = TextEditingController();
  final _controllertourTaille = TextEditingController();
  final _controllertourBassin = TextEditingController();
  final _controllertourCuisse = TextEditingController();
  final _controllerhauteurBassin = TextEditingController();
  final _controllerhauteurPoitrine = TextEditingController();
  final _controllerlongueurEpaule = TextEditingController();
  final _controllerlongueurBrasCoude = TextEditingController();
  final _controllerhauteurGenou = TextEditingController();
  final _controllerhauteurTaille = TextEditingController();
  final _controllertourHanche = TextEditingController();
  final _controllertourBras = TextEditingController();
  final _controllerlongueurDos = TextEditingController();
  final _controllerlongueurBras = TextEditingController();
  GenreClient _genre = GenreClient.homme;
  // List<String> mensurations = [
  //   "Tour de poitrine",
  //   "Tour de taille",
  //   "Tour de bassin",
  //   "Tour de cuisse",
  //   "Hauteur bassin",
  //   "Hauteur poitrine",
  //   "Longueur epaule",
  //   "longueur bras",
  //   "Hauteur bras-coude",
  //   "Hauteur genou",
  //   "Tour de hanche",
  //   "Hauteur taille",
  //   "Tour de bras",
  //   "Longueur dos"
  // ];
  void ajouterClient(
      String nom,
      String prenom,
      String telephone,
      String tourPoitrine,
      String tourTaille,
      String tourBassin,
      String tourCuisse,
      String hauteurBassin,
      String hauteurPoitrine,
      String longueurEpaule,
      String longueurBrasCoude,
      String hauteurGenou,
      String hauteurTaille,
      String tourHanche,
      String tourBras,
      String longueurDos,
      String longueurBras) {
    final nouveauClient = Client(
        id: listCLients.length + 1,
        utilisateurId: 1,
        nom: nom,
        prenom: prenom,
        telephone: telephone,
        dateEntree: DateTime.now(),
        tourPoitrine: tourPoitrine,
        tourTaille: tourTaille,
        tourBassin: tourBassin,
        tourCuisse: tourCuisse,
        hauteurBassin: hauteurBassin,
        hauteurPoitrine: hauteurPoitrine,
        longueurEpaule: longueurEpaule,
        longueurBrasCoude: longueurBrasCoude,
        hauteurGenou: hauteurGenou,
        hauteurTaille: hauteurTaille,
        tourHanche: tourHanche,
        tourBras: tourBras,
        longueurDos: longueurDos,
        longueurBras: longueurBras);
    setState(() {
      listCLients.add(nouveauClient);
    });
  }

  void submitData() {
    final txControllernom = _controllernom.text;
    final txControllerprenom = _controllerprenom.text;
    final txControllertelephone = _controllertelephone.text;
    final txControllertourPoitrine = _controllertourPoitrine.text;
    final txControllertourTaille = _controllertourTaille.text;
    final txControllertourBassin = _controllertourBassin.text;
    final txControllertourCuisse = _controllertourCuisse.text;
    final txControllerhauteurBassin = _controllerhauteurBassin.text;
    final txControllerhauteurPoitrine = _controllerhauteurPoitrine.text;
    final txControllerlongueurEpaule = _controllerlongueurEpaule.text;
    final txControllerlongueurBrasCoude = _controllerlongueurBrasCoude.text;
    final txControllerhauteurGenou = _controllerhauteurGenou.text;
    final txControllerhauteurTaille = _controllerhauteurTaille.text;
    final txControllertourHanche = _controllertourHanche.text;
    final txControllertourBras = _controllertourBras.text;
    final txControllerlongueurDos = _controllerlongueurDos.text;
    final txControllerlongueurBras = _controllerlongueurBras.text;
    ajouterClient(
        txControllernom,
        txControllerprenom,
        txControllertelephone,
        txControllertourPoitrine,
        txControllertourTaille,
        txControllertourBassin,
        txControllertourCuisse,
        txControllerhauteurBassin,
        txControllerhauteurPoitrine,
        txControllerlongueurEpaule,
        txControllerlongueurBrasCoude,
        txControllerhauteurGenou,
        txControllerhauteurTaille,
        txControllertourHanche,
        txControllertourBras,
        txControllerlongueurDos,
        txControllerlongueurBras);
    Navigator.of(context).pop();
  }

  Widget champMesure(String label, TextEditingController controllerChamp) {
    return Container(
      width: MediaQuery.of(context).size.width / 3,
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: controllerChamp,
            onSubmitted: (_) => submitData,
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                filled: true,
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.transparent, width: 0.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: Color.fromRGBO(56, 182, 255, 1), width: 0.5),
                ),
                hintText: '...'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final widthDevice = MediaQuery.of(context).size.width;
    final heightDevice = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          "Nouveau Client",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Informations personnels",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              width: widthDevice / 1.2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nom', style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 5),
                  TextField(
                    controller: _controllernom,
                    onSubmitted: (_) => submitData,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      filled: true,
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 0.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Color.fromRGBO(56, 182, 255, 1), width: 0.5),
                      ),
                      hintText: "Nom",
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: widthDevice / 1.2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Prenoms', style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 5),
                  TextField(
                    controller: _controllerprenom,
                    onSubmitted: (_) => submitData,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      filled: true,
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 0.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Color.fromRGBO(56, 182, 255, 1), width: 0.5),
                      ),
                      hintText: "prenoms",
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: widthDevice / 1.2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Telephone',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 5),
                  TextField(
                    controller: _controllertelephone,
                    onSubmitted: (_) => submitData,

                    // validator: (val) => val.length < 10 ? 'trop court' : null,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      filled: true,
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 0.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Color.fromRGBO(56, 182, 255, 1), width: 0.5),
                      ),
                      hintText: "00 00 00 00 00",
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Mensurations",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: Row(
                    children: [
                      Radio<GenreClient>(
                        value: GenreClient.homme,
                        groupValue: _genre,
                        onChanged: (GenreClient value) {
                          setState(() {
                            _genre = value;
                          });
                        },
                      ),
                      Text('Homme')
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Radio<GenreClient>(
                        value: GenreClient.femme,
                        groupValue: _genre,
                        onChanged: (GenreClient value) {
                          setState(() {
                            _genre = value;
                          });
                        },
                      ),
                      Text('Femme')
                    ],
                  ),
                ),
              ],
            ),
            Wrap(children: [
              champMesure('Tour de poitrine', _controllertourPoitrine),
              champMesure('Tour de taille', _controllertourTaille),
              champMesure('Tour de bassin', _controllertourBassin),
              champMesure('Tour de cuisse', _controllertourCuisse),
              champMesure('Hauteur bassin', _controllerhauteurBassin),
              champMesure('Hauteur poitrine', _controllerhauteurPoitrine),
              champMesure('Longueur epaule', _controllerlongueurEpaule),
              champMesure('Longueur bras', _controllerlongueurBras),
              champMesure('Longueur Bras-coude', _controllerlongueurBrasCoude),
              champMesure('Hauteur genou', _controllerhauteurGenou),
              champMesure('Tour de hanche', _controllertourHanche),
              champMesure('Hauteur taille', _controllerhauteurTaille),
              champMesure('Tour de bras', _controllertourBras),
              champMesure('Longueur dos', _controllerlongueurDos)
            ]),
            InkWell(
              onTap: submitData,
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color.fromRGBO(56, 182, 255, 1),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(4, 4),
                      blurRadius: 5,
                      color: Colors.grey.withOpacity(0.3),
                    ),
                  ],
                ),
                child: Text(
                  "Enregistrer",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
