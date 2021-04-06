import 'package:couture_manager/views/client_page.dart';
import 'package:couture_manager/views/connexion_page.dart';
import 'package:couture_manager/views/detail_Commande.dart';
import 'package:couture_manager/views/homePage.dart';
import 'package:flutter/material.dart';

import 'views/inscription_page.dart';
import 'views/profil_page.dart';

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
      },
    );
  }
}
