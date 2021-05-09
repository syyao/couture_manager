import 'package:couture_manager/database/couture_database.dart';
import 'package:couture_manager/model/client.dart';
import 'package:intl/intl.dart';

import 'detailClients.dart';
import 'drawerView.dart';
import 'formulaire_commande.dart';
import 'package:flutter/material.dart';

class NewCommande extends StatefulWidget {
  static const routeName = 'NewCommande';

  @override
  _NewCommandeState createState() => _NewCommandeState();
}

class _NewCommandeState extends State<NewCommande> {
  bool search = false;
  void dynamicSearch() {
    setState(() {
      search = !search;
    });
  }

  Widget defaultAppBar() {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.white),
      centerTitle: true,
      title: Text(
        "Nouvelle commande",
        style: TextStyle(color: Colors.white),
      ),
      actions: [
        IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              dynamicSearch();
            })
      ],
    );
  }

  Widget searchAppBar() {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.white),
      title: TextField(
        style: TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        autofocus: true,
        decoration: InputDecoration(
            hintText: "Rechercher un client",
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white)),
      ),
      leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () => dynamicSearch()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final widthDevice = MediaQuery.of(context).size.width;
    final heightDevice = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: HomeDrawer(),
      appBar: search ? searchAppBar() : defaultAppBar(),
      body: FutureBuilder<List<Client>>(
          future: CoutureDataBase.instance.clientList(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Client>> snapshot) {
            List<Client> clientListe = snapshot.data;
            if (snapshot.hasData) {
              return Container(
                padding: EdgeInsets.only(top: 10),
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(height: 10),
                  itemCount: clientListe.length,
                  itemBuilder: (context, i) {
                    return ClientItemWidget(
                      client: clientListe[i],
                    );
                  },
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}

class ClientItemWidget extends StatelessWidget {
  final Client client;

  const ClientItemWidget({Key key, @required this.client}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: true, // user must tap button!
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
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FormCommande(client: client),
                    ),
                  );
                },
              ),
              TextButton(
                child: Text('non'),
                onPressed: () {
                  print(client.toMap());
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailClient(client: client),
                    ),
                  );
                },
              ),
            ],
          );
        },
      );
    }

    final widthDevice = MediaQuery.of(context).size.width;
    final heightDevice = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: _showMyDialog,
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
                )
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
                        client.nom,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Entré le :${DateFormat.d().add_yMMM().format(client.dateEntree)}',
                        style: TextStyle(),
                      ),
                      Text(
                        'N° Tel: ${client.telephone}',
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                IconButton(
                    icon: Icon(Icons.info_outline_rounded), onPressed: () {})
              ],
            ),
          ),
        ),
      ],
    );
  }
}
