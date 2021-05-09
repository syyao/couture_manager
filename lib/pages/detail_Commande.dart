import 'dart:io';

import 'package:couture_manager/database/couture_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/client.dart';
import '../model/commande.dart';
import 'detailClients.dart';
import 'homePage.dart';

class DetailCommande extends StatefulWidget {
  final Commande commande;
  final Client client;
  static const routeName = "DetailCommande";

  const DetailCommande({Key key, this.commande, this.client}) : super(key: key);

  @override
  _DetailCommandeState createState() => _DetailCommandeState();
}

class _DetailCommandeState extends State<DetailCommande> {
  void showModelePage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(
              color: Color.fromRGBO(56, 182, 255, 1),
            ),
            elevation: 0,
            title: Text(
              'modèle',
              style: TextStyle(
                color: Color.fromRGBO(56, 182, 255, 1),
              ),
            ),
          ),
          body: Center(
            child: Hero(
              tag: 'model',
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Image.file(
                  File(widget.commande.model),
                  fit: BoxFit.cover,
                ),
                height: 400,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showTissuPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Color.fromRGBO(56, 182, 255, 1),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              'Tissu',
              style: TextStyle(
                color: Color.fromRGBO(56, 182, 255, 1),
              ),
            ),
          ),
          body: Center(
            child: Hero(
              tag: 'tissu',
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Image.file(
                  File(widget.commande.tissu),
                  fit: BoxFit.cover,
                ),
                height: 400,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _supprimerCommmande() {
    CoutureDataBase.instance.deleteCommande(widget.commande.id);
    Navigator.pushReplacementNamed(context, HomePage.routeName);
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Supprimé la commmande ?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Voulez-vous vraiment supprimé cette commande ?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(child: Text('oui'), onPressed: _supprimerCommmande),
            TextButton(
              child: Text('non'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final heigthDevice = MediaQuery.of(context).size.height;
    final widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          "Details",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(icon: Icon(Icons.delete), onPressed: _showMyDialog)
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    "Modèle",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () {
                      showModelePage(context);
                    },
                    child: Hero(
                      tag: 'model',
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.file(
                          File(widget.commande.model),
                          height: heigthDevice / 5,
                          width: heigthDevice / 5,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Tissu",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () {
                      showTissuPage(context);
                    },
                    child: Hero(
                      tag: 'tissu',
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.file(
                          File(widget.commande.tissu),
                          height: heigthDevice / 5,
                          width: heigthDevice / 5,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      """Sydney Yao""",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: Icon(Icons.straighten_rounded),
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => DetailClient(),
                        //     ));
                      },
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'A rendre le: ',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    Text(
                      DateFormat.d()
                          .add_yMMM()
                          .format(widget.commande.dateHeureLivraison),
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Text(
                  "Description",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color.fromRGBO(56, 182, 255, 1),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  child: Text(widget.commande.description),
                  // Text("""chemise manche longue avec deux poches sur le
                  //    cotéchemise manche longue avec deux poches sur le
                  //     cotéchemise manche longue avec deux poches sur le
                  //     cotéchemise manche longue avec deux poches sur le coté"""),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      'Montant : ',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    Text(
                      // "date de livraison",
                      "${widget.commande.montant} Fcfa",
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      'Avance : ',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    Text(
                      // "date de livraison",
                      "${widget.commande.avance} Fcfa",
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Text(
                      'Reste a Payer : ',
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(
                      "${widget.commande.montant} Fcfa",
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
                SizedBox(height: 15),
              ],
            ),
          )
        ],
      ),
    );
  }
}
