import 'package:couture_manager/database/couture_database.dart';
import 'package:couture_manager/model/client.dart';
import 'package:flutter/material.dart';

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
  String _controllergenre;

  void ajouterClient(
      String nom,
      String prenom,
      String telephone,
      String sexe,
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
        // id: defaultListClient.length + 1,
        nom: nom,
        prenom: prenom,
        telephone: telephone,
        sexe: sexe,
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
      CoutureDataBase.instance.insertClient(nouveauClient);
      Navigator.of(context).pop();
      // defaultListClient.add(nouveauClient);
    });
  }

  void submitData() {
    final txControllernom = _controllernom.text;
    final txControllerprenom = _controllerprenom.text;
    final txControllertelephone = _controllertelephone.text;
    final txControllersexe = _controllergenre;
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
        txControllersexe,
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
  }

  void _handleGenderChange(String value) {
    setState(() {
      _controllergenre = value;
      print(value);
    });
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
          TextFormField(
            controller: controllerChamp,
            onFieldSubmitted: (_) => submitData,
            keyboardType: TextInputType.number,
            validator: (valid) =>
                valid.trim().isEmpty ? "veuillez renseigner ce champ" : null,
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

  final _keyForm = GlobalKey<FormState>();
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
        child: Form(
          key: _keyForm,
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
                    TextFormField(
                      controller: _controllernom,
                      validator: (valid) => valid.trim().isEmpty
                          ? "veuillez renseigner ce champ"
                          : null,
                      onFieldSubmitted: (_) => submitData,
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
                              color: Color.fromRGBO(56, 182, 255, 1),
                              width: 0.5),
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
                    TextFormField(
                      controller: _controllerprenom,
                      validator: (valid) => valid.trim().isEmpty
                          ? "veuillez renseigner ce champ"
                          : null,
                      onFieldSubmitted: (_) => submitData,
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
                              color: Color.fromRGBO(56, 182, 255, 1),
                              width: 0.5),
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
                    TextFormField(
                      controller: _controllertelephone,
                      onFieldSubmitted: (_) => submitData,
                      keyboardType: TextInputType.phone,
                      validator: (val) => val.length < 10 ? 'trop court' : null,
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
                              color: Color.fromRGBO(56, 182, 255, 1),
                              width: 0.5),
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
                        Radio<String>(
                          value: "Homme",
                          groupValue: _controllergenre,
                          onChanged: _handleGenderChange,
                        ),
                        Text('Homme'),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Radio<String>(
                          value: "Femme",
                          groupValue: _controllergenre,
                          onChanged: _handleGenderChange,
                        ),
                        Text('Femme'),
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
                champMesure(
                    'Longueur Bras-coude', _controllerlongueurBrasCoude),
                champMesure('Hauteur genou', _controllerhauteurGenou),
                champMesure('Tour de hanche', _controllertourHanche),
                champMesure('Hauteur taille', _controllerhauteurTaille),
                champMesure('Tour de bras', _controllertourBras),
                champMesure('Longueur dos', _controllerlongueurDos)
              ]),
              InkWell(
                onTap: () {
                  if (_keyForm.currentState.validate()) {
                    // _keyForm.currentState.save();
                    return submitData();
                  }
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
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
      ),
    );
  }
}
