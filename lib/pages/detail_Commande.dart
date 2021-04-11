import 'package:flutter/material.dart';

import 'detailClients.dart';

class DetailCommande extends StatefulWidget {
  static const routeName = "DetailCommande";

  @override
  _DetailCommandeState createState() => _DetailCommandeState();
}

class _DetailCommandeState extends State<DetailCommande> {
  void showModelePage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(
              color: Color.fromRGBO(56, 182, 255, 1),
            ),
            elevation: 0,
            title: Text(
              'modèle',
              style: TextStyle(
                color: Color.fromRGBO(56, 182, 255, 1),
              ),
            ),
          ),
          body: Center(
            child: Hero(
              tag: 'model',
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Image(
                    image: AssetImage('images/mdl.jpg'), fit: BoxFit.cover),
                height: 400,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showTissuPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Color.fromRGBO(56, 182, 255, 1),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              'Tissu',
              style: TextStyle(
                color: Color.fromRGBO(56, 182, 255, 1),
              ),
            ),
          ),
          body: Center(
            child: Hero(
              tag: 'tissu',
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Image(
                    image: AssetImage('images/tss.jpg'), fit: BoxFit.cover),
                height: 400,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final heigthDevice = MediaQuery.of(context).size.height;
    final widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          "Details",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    "Modèle",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () {
                      showModelePage(context);
                    },
                    child: Hero(
                      tag: 'model',
                      child: Container(
                        height: heigthDevice / 5,
                        width: heigthDevice / 5,
                        decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.1),
                            image: DecorationImage(
                                image: AssetImage('images/mdl.jpg'),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(15)),
                        //   child: Image(
                        //     image: AssetImage("images/pantalon.jpg"),
                        // ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Tissu",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () {
                      showTissuPage(context);
                    },
                    child: Hero(
                      tag: 'tissu',
                      child: Container(
                        height: heigthDevice / 5,
                        width: heigthDevice / 5,
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: AssetImage('images/tss.jpg'),
                              fit: BoxFit.cover),
                        ),
                        //   child: Image(
                        //     image: AssetImage("images/pantalon.jpg"),
                        // ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      """Sydney Yao""",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                        icon: Icon(Icons.straighten_rounded),
                        onPressed: () {
                          Navigator.pushNamed(context, DetailClient.routeName);
                        })
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'A rendre le: ',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    Text(
                      "4 Avril 13:17",
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Text(
                  "Description",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color.fromRGBO(56, 182, 255, 1),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                    child: Text(
                        """chemise manche longue avec deux poches sur le cotéchemise manche longue avec deux poches sur le cotéchemise manche longue avec deux poches sur le cotéchemise manche longue avec deux poches sur le coté"""))
              ],
            ),
          )
        ],
      ),
    );
  }
}
