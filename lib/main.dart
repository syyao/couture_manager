import 'package:couture_manager/pages/nouveau_client.dart';
import 'package:flutter/material.dart';

import 'pages/client_page.dart';
import 'pages/connexion/connexion_page.dart';
import 'pages/detailClients.dart';
import 'pages/detail_Commande.dart';
import 'pages/formulaire_commande.dart';
import 'pages/historiquePage.dart';
import 'pages/homePage.dart';
import 'pages/connexion/inscription_page.dart';
import 'pages/new_commande.dart';
import 'pages/profil_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(56, 182, 255, 1),
        accentColor: Color.fromRGBO(56, 182, 255, 1),
      ),
      home: Connexion(),
      routes: {
        Inscription.routeName: (context) => Inscription(),
        Connexion.routeName: (context) => Connexion(),
        HomePage.routeName: (context) => HomePage(),
        DetailCommande.routeName: (context) => DetailCommande(),
        ProfilPage.routeName: (context) => ProfilPage(),
        ClientPage.routeName: (context) => ClientPage(),
        NouveauClient.routeName: (context) => NouveauClient(),
        HistoriquePage.routeName: (context) => HistoriquePage(),
        NewCommande.routeName: (context) => NewCommande(),
        FormCommande.routeName: (context) => FormCommande(),
        DetailClient.routeName: (context) => DetailClient(),
      },
    );
  }
}
