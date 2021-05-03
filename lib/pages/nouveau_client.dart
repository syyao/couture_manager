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
  String _controllergenre = "Femme";

  void ajouterClient() {
    final nouveauClient = Client(
        nom: _controllernom.text,
        prenom: _controllerprenom.text,
        telephone: _controllertelephone.text,
        sexe: _controllergenre,
        dateEntree: DateTime.now(),
        tourPoitrine: _controllertourPoitrine.text,
        tourTaille: _controllertourTaille.text,
        tourBassin: _controllertourBassin.text,
        tourCuisse: _controllertourCuisse.text,
        hauteurBassin: _controllerhauteurBassin.text,
        hauteurPoitrine: _controllerhauteurPoitrine.text,
        longueurEpaule: _controllerlongueurEpaule.text,
        longueurBrasCoude: _controllerlongueurBrasCoude.text,
        hauteurGenou: _controllerhauteurGenou.text,
        hauteurTaille: _controllerhauteurTaille.text,
        tourHanche: _controllertourHanche.text,
        tourBras: _controllertourBras.text,
        longueurDos: _controllerlongueurDos.text,
        longueurBras: _controllerlongueurBras.text);
    CoutureDataBase.instance.insertClient(nouveauClient);
    Navigator.of(context).pop(true);
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
            onFieldSubmitted: (_) => ajouterClient,
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
                      onFieldSubmitted: (_) => ajouterClient,
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
                      onFieldSubmitted: (_) => ajouterClient,
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
                      onFieldSubmitted: (_) => ajouterClient,
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
                    return ajouterClient();
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
