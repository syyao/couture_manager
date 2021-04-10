import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DetailClient extends StatefulWidget {
  static const routeName = 'newClient';

  @override
  _DetailClientState createState() => _DetailClientState();
}

class _DetailClientState extends State<DetailClient> {
  List<String> mensurations = [
    "Tour de poitrine",
    "Tour de taille",
    "Tour de bassin",
    "Tour de cuisse",
    "Hauteur bassin",
    "Hauteur poitrine",
    "Longueur epaule",
    "longueur bras",
    "Hauteur bras-coude",
    "Hauteur genou",
    "Tour de hanche",
    "Hauteur taille",
    "Tour de bras",
    "Longueur dos"
  ];
  bool radioval = false;
  @override
  Widget build(BuildContext context) {
    final widthDevice = MediaQuery.of(context).size.width;
    final heightDevice = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          "Nouveau Client",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Informations personnels",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              width: widthDevice / 1.2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nom & prenoms', style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 5),
                  TextFormField(
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      filled: true,
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 0.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Color.fromRGBO(56, 182, 255, 1), width: 0.5),
                      ),
                      hintText: "Yao Sydney",
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: widthDevice / 1.2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Telephone',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 5),
                  TextFormField(
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      filled: true,
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 0.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Color.fromRGBO(56, 182, 255, 1), width: 0.5),
                      ),
                      hintText: "00 00 00 00 00",
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Mensurations",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: Row(
                    children: [
                      Radio<bool>(
                          value: radioval,
                          groupValue: this.radioval,
                          onChanged: (bool value) {}),
                      Text('Homme')
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Radio<bool>(
                          value: radioval,
                          groupValue: this.radioval,
                          onChanged: (bool value) {}),
                      Text('Femme')
                    ],
                  ),
                ),
              ],
            ),
            Wrap(
                children: mensurations
                    .map(
                      (e) => Container(
                        width: widthDevice / 3,
                        margin: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              e,
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                filled: true,
                                border: InputBorder.none,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.transparent, width: 0.5),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(56, 182, 255, 1),
                                      width: 0.5),
                                ),
                                hintText: e,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList()),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color.fromRGBO(56, 182, 255, 1),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(4, 4),
                    blurRadius: 5,
                    color: Colors.grey.withOpacity(0.3),
                  ),
                ],
              ),
              child: Text(
                "Enregistrer",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
