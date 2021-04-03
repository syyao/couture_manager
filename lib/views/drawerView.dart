import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final heightDevice = MediaQuery.of(context).size.height;
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
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
          Container(
            padding: EdgeInsets.all(10),
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
          Container(
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
          Container(
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
          SizedBox(height: heightDevice / 4),
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
          )
        ],
      ),
    );
  }
}
