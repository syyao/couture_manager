import 'package:couture_manager/views/client_page.dart';
import 'package:couture_manager/views/historiquePage.dart';
import 'package:couture_manager/views/homePage.dart';
import 'package:flutter/material.dart';

import 'profil_page.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final heightDevice = MediaQuery.of(context).size.height;
    return Drawer(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        color: Colors.blue[100], shape: BoxShape.circle),
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    child: Text('lesyde@outlook.fr'),
                  ),
                ],
              ),
            ),
            SizedBox(height: heightDevice / 5),
            InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, HomePage.routeName);
              },
              child: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(
                      Icons.shopping_basket_rounded,
                      color: Colors.black,
                    ),
                    SizedBox(width: 10),
                    Text('Mes commandes', style: TextStyle(color: Colors.black))
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, ProfilPage.routeName);
              },
              child: Container(
                padding: EdgeInsets.all(10),
                color: Colors.transparent,
                child: Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    SizedBox(width: 10),
                    Text('Mon profil', style: TextStyle(color: Colors.black))
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, HistoriquePage.routeName);
              },
              child: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(
                      Icons.bookmark,
                      color: Colors.black,
                    ),
                    SizedBox(width: 10),
                    Text('Historique', style: TextStyle(color: Colors.black))
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, ClientPage.routeName);
              },
              child: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(
                      Icons.people,
                      color: Colors.black,
                    ),
                    SizedBox(width: 10),
                    Text('Mes clients', style: TextStyle(color: Colors.black))
                  ],
                ),
              ),
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Icon(
                    Icons.power_settings_new,
                    color: Colors.black,
                  ),
                  SizedBox(width: 10),
                  Text('Deconnexion', style: TextStyle(color: Colors.black))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
