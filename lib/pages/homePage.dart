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

  @override
  Widget build(BuildContext context) {
    final widthDevice = MediaQuery.of(context).size.width;
    final heightDevice = MediaQuery.of(context).size.height;
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
      body: Container(
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
                    Navigator.pushNamed(context, DetailCommande.routeName);
                  },
                  child: Container(
                    width: widthDevice / 1.2,
                    padding: EdgeInsets.all(10),
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
                                listCLients[i],
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
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
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Container(
                            height: heightDevice / 6,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('images/mdl.jpg'),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
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
