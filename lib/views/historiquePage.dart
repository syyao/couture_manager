import 'package:flutter/material.dart';

import 'drawerView.dart';

class HistoriquePage extends StatelessWidget {
  static const routeName = 'historique';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.filter_list), onPressed: () {}),
        ],
        title: Text(
          "historique",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
