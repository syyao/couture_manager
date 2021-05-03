import 'package:couture_manager/database/couture_database.dart';
import 'package:couture_manager/model/client.dart';
import 'package:couture_manager/pages/client_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetailClient extends StatefulWidget {
  static const routeName = 'detailClient';
  final Client client;

  const DetailClient({Key key, this.client}) : super(key: key);
  @override
  _DetailClientState createState() => _DetailClientState();
}

class _DetailClientState extends State<DetailClient> {
  TextEditingController _controllernom = TextEditingController();
  TextEditingController _controllerprenom = TextEditingController();
  TextEditingController _controllertelephone = TextEditingController();
  TextEditingController _controllertourPoitrine = TextEditingController();
  TextEditingController _controllertourTaille = TextEditingController();
  TextEditingController _controllertourBassin = TextEditingController();
  TextEditingController _controllertourCuisse = TextEditingController();
  TextEditingController _controllerhauteurBassin = TextEditingController();
  TextEditingController _controllerhauteurPoitrine = TextEditingController();
  TextEditingController _controllerlongueurEpaule = TextEditingController();
  TextEditingController _controllerlongueurBrasCoude = TextEditingController();
  TextEditingController _controllerhauteurGenou = TextEditingController();
  TextEditingController _controllerhauteurTaille = TextEditingController();
  TextEditingController _controllertourHanche = TextEditingController();
  TextEditingController _controllertourBras = TextEditingController();
  TextEditingController _controllerlongueurDos = TextEditingController();
  TextEditingController _controllerlongueurBras = TextEditingController();

  @override
  void initState() {
    _controllernom.text = widget.client.nom;
    _controllerprenom.text = widget.client.prenom;
    _controllertelephone.text = widget.client.telephone;
    _controllertourPoitrine.text = widget.client.tourPoitrine;
    _controllertourTaille.text = widget.client.tourTaille;
    _controllertourBassin.text = widget.client.tourBassin;
    _controllertourCuisse.text = widget.client.tourCuisse;
    _controllerhauteurBassin.text = widget.client.hauteurBassin;
    _controllerhauteurPoitrine.text = widget.client.hauteurPoitrine;
    _controllerlongueurEpaule.text = widget.client.longueurEpaule;
    _controllerlongueurBrasCoude.text = widget.client.longueurBrasCoude;
    _controllerhauteurGenou.text = widget.client.hauteurGenou;
    _controllerhauteurTaille.text = widget.client.hauteurTaille;
    _controllertourHanche.text = widget.client.tourHanche;
    _controllertourBras.text = widget.client.tourBras;
    _controllerlongueurDos.text = widget.client.longueurDos;
    _controllerlongueurBras.text = widget.client.longueurBras;

    super.initState();
  }

  void _updateClient() {
    final nouveauClient = Client(
        id: widget.client.id,
        nom: _controllernom.text,
        prenom: _controllerprenom.text,
        telephone: _controllertelephone.text,
        dateEntree: widget.client.dateEntree,
        sexe: widget.client.sexe,
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
    CoutureDataBase.instance.updateclient(nouveauClient);
    Navigator.of(context).pop(true);
  }

  void _supprimerClient() {
    CoutureDataBase.instance.deleteClient(widget.client.id);
    Navigator.pushReplacementNamed(context, ClientPage.routeName);
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Supprimé le client ?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Voulez-vous vraiment supprimé ce client ?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(child: Text('oui'), onPressed: _supprimerClient),
            TextButton(
              child: Text('non'),
              onPressed: () {},
            ),
          ],
        );
      },
    );
  }

  Widget champMesureClient(
    String label,
    TextEditingController controllerChamp,
    String hintLabel,
  ) {
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
            keyboardType: TextInputType.number,
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

  String _controllergenre() {
    if (widget.client.sexe == "Homme") {
      return 'Homme';
    } else if (widget.client.sexe == "Femme") {
      return 'Femme';
    } else {
      return '';
    }
  }

  void _handleGenderChange(String value) {
    setState(() {
      // _controllergenre == value;
      print(value);
    });
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
          "detail Client",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.delete, color: Colors.white),
              onPressed: _showMyDialog)
        ],
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
                  TextFormField(
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
                  TextFormField(
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
                  TextFormField(
                    controller: _controllertelephone,
                    keyboardType: TextInputType.number,
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
                      Radio<String>(
                        value: "Homme",
                        groupValue: _controllergenre(),
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
                        groupValue: _controllergenre(),
                        onChanged: _handleGenderChange,
                      ),
                      Text('Femme'),
                    ],
                  ),
                ),
              ],
            ),
            Wrap(children: [
              champMesureClient(
                'Tour de poitrine',
                _controllertourPoitrine,
                widget.client.tourPoitrine.toString(),
              ),
              champMesureClient(
                'Tour de taille',
                _controllertourTaille,
                widget.client.tourTaille.toString(),
              ),
              champMesureClient(
                'Tour de bassin',
                _controllertourBassin,
                widget.client.tourBassin.toString(),
              ),
              champMesureClient(
                'Tour de cuisse',
                _controllertourCuisse,
                widget.client.tourCuisse.toString(),
              ),
              champMesureClient(
                'Hauteur bassin',
                _controllerhauteurBassin,
                widget.client.hauteurBassin.toString(),
              ),
              champMesureClient(
                'Hauteur poitrine',
                _controllerhauteurPoitrine,
                widget.client.hauteurPoitrine.toString(),
              ),
              champMesureClient(
                'Longueur epaule',
                _controllerlongueurEpaule,
                widget.client.longueurEpaule.toString(),
              ),
              champMesureClient(
                'Longueur bras',
                _controllerlongueurBras,
                widget.client.longueurBras.toString(),
              ),
              champMesureClient(
                'Longueur Bras-coude',
                _controllerlongueurBrasCoude,
                widget.client.longueurBrasCoude.toString(),
              ),
              champMesureClient(
                'Hauteur genou',
                _controllerhauteurGenou,
                widget.client.hauteurGenou.toString(),
              ),
              champMesureClient(
                'Tour de hanche',
                _controllertourHanche,
                widget.client.tourHanche.toString(),
              ),
              champMesureClient(
                'Hauteur taille ',
                _controllerhauteurTaille,
                widget.client.hauteurTaille.toString(),
              ),
              champMesureClient(
                'Tour de bras',
                _controllertourBras,
                widget.client.tourBras.toString(),
              ),
              champMesureClient(
                'Longueur dos',
                _controllerlongueurDos,
                widget.client.longueurDos.toString(),
              ),
            ]),
            InkWell(
              onTap: _updateClient,
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
    );
  }
}
