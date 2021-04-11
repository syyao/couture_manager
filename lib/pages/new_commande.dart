import 'detailClients.dart';
import 'formulaire_commande.dart';
import 'package:flutter/material.dart';

import 'detail_Commande.dart';

class NewCommande extends StatefulWidget {
  static const routeName = 'NewCommande';

  @override
  _NewCommandeState createState() => _NewCommandeState();
}

class _NewCommandeState extends State<NewCommande> {
  List<String> listCLients = [
    "Sydney",
    "Yao",
    "Nath",
    "Oceane",
    "Samson",
    "Tom",
    "Nath",
    "Boris"
  ];

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Nouvelle commande'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Voulez-vous continuez avec ses mensurations ?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('oui'),
              onPressed: () {
                Navigator.pushReplacementNamed(context, FormCommande.routeName);
              },
            ),
            TextButton(
              child: Text('non'),
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(DetailClient.routeName);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: true,
          title: Text(
            'Nouvelle commande',
            style: TextStyle(color: Colors.white),
          )),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: widthDevice / 1.2,
                child: TextFormField(
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
                      hintText: "rechercher un client",
                      suffixIcon: Icon(Icons.search)),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 10),
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) =>
                    SizedBox(height: 10),
                itemCount: listCLients.length,
                itemBuilder: (context, i) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          _showMyDialog();
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          width: widthDevice / 1.2,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(4, 4),
                                blurRadius: 5,
                                color: Colors.grey.withOpacity(0.3),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      listCLients[i],
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Entré le :3 avril 18:41',
                                      style: TextStyle(),
                                    ),
                                    Text(
                                      'N° Tel: 0141270085',
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 20),
                              IconButton(
                                  icon: Icon(Icons.info_outline_rounded),
                                  onPressed: () {})
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
