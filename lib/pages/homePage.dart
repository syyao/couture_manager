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

List<Commande> commandListEnCours;

@override
class _HomePageState extends State<HomePage> {
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
          future: CoutureDataBase.instance.commandListByEtat("en cours"),
          builder:
              (BuildContext context, AsyncSnapshot<List<Commande>> snapshot) {
            List<Commande> commandeListe = snapshot.data;

            if (snapshot.hasData) {
              if (commandeListe.isEmpty) {
                return Center(
                  child: Text("Aucune commande en cours"),
                );
              }
              return Container(
                padding: EdgeInsets.only(top: 10),
                child: ListView.builder(
                  itemCount: commandeListe.length,
                  itemBuilder: (ctx, i) {
                    return CommandItem(
                      commande: commandeListe[i],
                      refresh: () {
                        setState(() {});
                      },
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

class CommandItem extends StatefulWidget {
  final Client client;
  final Commande commande;
  final Function refresh;

  const CommandItem({Key key, this.client, this.commande, this.refresh})
      : super(key: key);

  @override
  _CommandItemState createState() => _CommandItemState();
}

class _CommandItemState extends State<CommandItem> {
  Client selectedClient;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getClient();
    });
  }

  getClient() async {
    selectedClient =
        await CoutureDataBase.instance.getclientById(widget.commande.clientId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final widthDevice = MediaQuery.of(context).size.width;
    final heightDevice = MediaQuery.of(context).size.height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () async {
            var isClientCreated = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailCommande(
                    commande: widget.commande,
                    client: selectedClient,
                  ),
                ));
            if (isClientCreated != null) {
              bool _isClientCreated = isClientCreated as bool;
              if (_isClientCreated) {
                widget.refresh();
              }
            }
          },
          // onTap: () {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => DetailCommande(
          //         commande: widget.commande,
          //         client: selectedClient,
          //       ),
          //     ),
          //   );
          // },
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
                        selectedClient == null
                            ? ''
                            : '${selectedClient.nom} ${selectedClient.prenom}',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        selectedClient == null
                            ? ''
                            : '${selectedClient.telephone}',
                      ),
                      Text(
                        '${DateFormat.d().add_yMMM().format(widget.commande.dateHeureLivraison)}',
                        style: TextStyle(),
                      ),
                      Row(
                        children: [
                          widget.commande.etat == "rendu"
                              ? Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 20,
                                )
                              : Icon(
                                  Icons.close,
                                  color: Colors.red,
                                  size: 20,
                                ),
                          Text(
                            widget.commande.etat,
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
                    File(widget.commande.model),
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
