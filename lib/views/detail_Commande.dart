import 'package:flutter/material.dart';

class DetailCommande extends StatelessWidget {
  static const routeName = "DetailCommande";
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
                  Container(
                    height: heigthDevice / 5,
                    width: heigthDevice / 5,
                    decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(15)),
                    //   child: Image(
                    //     image: AssetImage("images/pantalon.jpg"),
                    // ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Tissu",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: heigthDevice / 5,
                    width: heigthDevice / 5,
                    decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(15)),
                    //   child: Image(
                    //     image: AssetImage("images/pantalon.jpg"),
                    // ),
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
                        icon: Icon(Icons.straighten_rounded), onPressed: () {})
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
                  "Informations",
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
