import 'package:couture_manager/model/client.dart';
import 'package:flutter/material.dart';

enum GenreClient { homme, femme }

class DetailClient extends StatefulWidget {
  static const routeName = 'detailClient';
  final Client client;

  const DetailClient({Key key, this.client}) : super(key: key);
  @override
  _DetailClientState createState() => _DetailClientState();
}

class _DetailClientState extends State<DetailClient> {
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
  // void modifierclient() {}
  Widget champMesureClient(
      String label, TextEditingController controllerChamp, String hintLabel) {
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
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
              hintText: hintLabel,
            ),
          ),
        ],
      ),
    );
  }

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

  @override
  Widget build(BuildContext context) {
    final widthDevice = MediaQuery.of(context).size.width;
    final heightDevice = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          "detail Client",
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
                  Text("Nom", style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 5),
                  TextField(
                    controller: _controllernom,
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
                      hintText: widget.client.nom,
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
                      hintText: widget.client.prenom,
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
                      hintText: "${widget.client.telephone}",
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
              champMesureClient('Tour de poitrine', _controllertourPoitrine,
                  widget.client.tourPoitrine),
              champMesureClient('Tour de taille', _controllertourTaille,
                  widget.client.tourTaille),
              champMesureClient('Tour de bassin', _controllertourBassin,
                  widget.client.tourBassin),
              champMesureClient('Tour de cuisse', _controllertourCuisse,
                  widget.client.tourCuisse),
              champMesureClient('Hauteur bassin', _controllerhauteurBassin,
                  widget.client.hauteurBassin),
              champMesureClient('Hauteur poitrine', _controllerhauteurPoitrine,
                  widget.client.hauteurPoitrine),
              champMesureClient('Longueur epaule', _controllerlongueurEpaule,
                  widget.client.longueurEpaule),
              champMesureClient('Longueur bras', _controllerlongueurBras,
                  widget.client.longueurBras),
              champMesureClient(
                  'Longueur Bras-coude',
                  _controllerlongueurBrasCoude,
                  widget.client.longueurBrasCoude),
              champMesureClient('Hauteur genou', _controllerhauteurGenou,
                  widget.client.hauteurGenou),
              champMesureClient('Tour de hanche', _controllertourHanche,
                  widget.client.tourHanche),
              champMesureClient('Hauteur taille ', _controllerhauteurTaille,
                  widget.client.hauteurTaille),
              champMesureClient(
                  'Tour de bras', _controllertourBras, widget.client.tourBras),
              champMesureClient('Longueur dos', _controllerlongueurDos,
                  widget.client.longueurDos),
            ]),
            Container(
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
            )
          ],
        ),
      ),
    );
  }
}
