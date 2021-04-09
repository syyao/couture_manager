import 'dart:ui';

import 'package:flutter/material.dart';

import 'detail_Commande.dart';
import 'drawerView.dart';

class HistoriquePage extends StatelessWidget {
  static const routeName = 'historique';
  @override
  Widget build(BuildContext context) {
    final heightDevice = MediaQuery.of(context).size.height;
    final widthDevice = MediaQuery.of(context).size.width;
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
        body: Container(
          padding: EdgeInsets.only(top: 10),
          child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) =>
                SizedBox(height: 10),
            itemCount: 10,
            itemBuilder: (context, i) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, DetailCommande.routeName);
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
                                  """Sydney Yao""",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'N° Tel: 0141270085',
                                ),
                                Text(
                                  '3 avril 18:41',
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
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 20),
                          Container(
                            height: heightDevice / 6,
                            width: heightDevice / 6,
                            decoration: BoxDecoration(
                                color: Colors.blue.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(15)),
                            //   child: Image(
                            //     image: AssetImage("images/pantalon.jpg"),
                            // ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ));
  }
}
