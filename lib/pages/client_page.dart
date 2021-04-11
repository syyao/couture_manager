import 'package:flutter/material.dart';

import 'detailClients.dart';
import 'drawerView.dart';

class ClientPage extends StatefulWidget {
  static const routeName = 'client';

  @override
  _ClientPageState createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
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
        "Mes clients",
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
                    Navigator.pushNamed(context, DetailClient.routeName);
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
                                listCLients[i],
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Entré le :3 avril 18:41',
                                style: TextStyle(),
                              ),
                              Text(
                                'N° Tel: 0141270085',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        IconButton(
                            icon: Icon(Icons.info_outline_rounded),
                            onPressed: () {})
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
          size: 25,
        ),
        onPressed: () {
          Navigator.pushNamed(context, DetailClient.routeName);
        },
      ),
    );
  }
}
