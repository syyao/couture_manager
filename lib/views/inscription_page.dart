import 'package:couture_manager/views/connexion_page.dart';
import 'package:flutter/material.dart';

class Inscription extends StatelessWidget {
  static const routeName = 'inscription';
  @override
  Widget build(BuildContext context) {
    final heightdevice = MediaQuery.of(context).size.height;
    final widthdevice = MediaQuery.of(context).size.width;
    final longestSide = MediaQuery.of(context).size.longestSide;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: longestSide,
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(height: heightdevice / 20),
              Container(
                height: heightdevice / 4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/coutue.png'),
                  ),
                ),
              ),
              Container(
                width: widthdevice / 1.2,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            filled: true,
                            border: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(56, 182, 255, 1),
                                  width: 0.5),
                            ),
                            hintText: "Nom ",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      flex: 3,
                      child: Container(
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            filled: true,
                            border: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(56, 182, 255, 1),
                                  width: 0.5),
                            ),
                            hintText: "Prénoms",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: heightdevice / 40),
              Container(
                width: widthdevice / 1.2,
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    filled: true,
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(56, 182, 255, 1),
                            width: 0.5)),
                    hintText: "Date de naissance",
                  ),
                ),
              ),
              SizedBox(height: heightdevice / 40),
              Container(
                width: widthdevice / 1.2,
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    filled: true,
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(56, 182, 255, 1), width: 0.5),
                    ),
                    hintText: "Adresse E-mail",
                  ),
                ),
              ),
              SizedBox(height: heightdevice / 40),
              Container(
                width: widthdevice / 1.2,
                child: TextField(
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      filled: true,
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(56, 182, 255, 1),
                              width: 0.5)),
                      hintText: "mot de passe",
                      suffixIcon: Icon(
                        Icons.visibility_off,
                        size: 18,
                      )),
                ),
              ),
              SizedBox(height: heightdevice / 40),
              Container(
                width: widthdevice / 1.2,
                child: TextField(
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      filled: true,
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(56, 182, 255, 1),
                              width: 0.5)),
                      hintText: " confirmez mot de passe",
                      suffixIcon: Icon(
                        Icons.visibility_off,
                        size: 18,
                      )),
                ),
              ),
              SizedBox(height: heightdevice / 40),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(Connexion.routeName);
                },
                child: Card(
                  color: Color.fromRGBO(56, 182, 255, 1),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "S'inscrire",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: heightdevice / 40),
              Text(
                "Continuer avec",
              ),
              SizedBox(height: heightdevice / 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    child: Image(
                        image: AssetImage('images/gle.png'), fit: BoxFit.cover),
                  ),
                  Container(
                    height: 50,
                    child: Image(
                      image: AssetImage('images/apple.png'),
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
              SizedBox(height: heightdevice / 40),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(Connexion.routeName);
                },
                child: Container(
                  width: widthdevice / 1.2,
                  child: Text(
                    "Connectez vous ?",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
