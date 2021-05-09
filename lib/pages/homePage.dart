import 'dart:io';

import 'package:intl/intl.dart';

import '../database/couture_database.dart';
import '../model/client.dart';
import '../model/commande.dart';
import '../model/commande.dart';
import 'detail_Commande.dart';
import 'detail_Commande.dart';
import 'new_commande.dart';
import 'package:flutter/material.dart';

import 'drawerView.dart';

class HomePage extends StatefulWidget {
  static const routeName = "homePage";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        actions: [
          //     IconButton(icon: Icon(Icons.filter_list), onPressed: () {}),
        ],
        title: Text(
          "Mes commandes",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder<List<Commande>>(
          future: CoutureDataBase.instance.commandList(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Commande>> snapshot) {
            List<Commande> commandeListe = snapshot.data;
            if (snapshot.hasData) {
              return Container(
                padding: EdgeInsets.only(top: 10),
                child: ListView.builder(
                  itemCount: commandeListe.length,
                  itemBuilder: (ctx, i) {
                    return CommandItem(
                      commande: commandeListe[i],
                    );
                  },
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 20,
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(NewCommande.routeName);
        },
      ),
    );
  }
}

class CommandItem extends StatelessWidget {
  final Client client;
  final Commande commande;

  const CommandItem({Key key, this.client, this.commande}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final widthDevice = MediaQuery.of(context).size.width;
    final heightDevice = MediaQuery.of(context).size.height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailCommande(
                  commande: commande,
                ),
              ),
            );
          },
          child: Container(
            width: widthDevice / 1.2,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'NomDuClient',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'N° Tel: du client',
                      ),
                      Text(
                        '${DateFormat.d().add_yMMM().format(commande.dateHeureLivraison)}',
                        style: TextStyle(),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.check_rounded,
                            color: Colors.green,
                            size: 20,
                          ),
                          Text(
                            'Rendu',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                    child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.file(
                    File(commande.model),
                    height: heightDevice / 6,
                    fit: BoxFit.cover,
                  ),
                )

                    // Container(
                    //   height: heightDevice / 6,
                    //   decoration: BoxDecoration(
                    //       image: DecorationImage(image: AssetImage(
                    //           // "commande.tissu,"
                    //           "images/tss.jpg"), fit: BoxFit.cover),
                    //       borderRadius: BorderRadius.circular(10)),
                    // ),
                    )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
