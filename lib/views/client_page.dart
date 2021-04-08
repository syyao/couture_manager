import 'package:flutter/material.dart';

import 'detailClients.dart';
import 'drawerView.dart';

class ClientPage extends StatelessWidget {
  static const routeName = 'client';
  @override
  Widget build(BuildContext context) {
    final widthDevice = MediaQuery.of(context).size.width;
    final heightDevice = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: HomeDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          "Mes clients",
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
                                """Sydney Yao""",
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
        onPressed: () {},
      ),
    );
  }
}
