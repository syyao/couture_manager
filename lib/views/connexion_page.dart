import 'package:flutter/material.dart';

import 'homePage.dart';
import 'inscription_page.dart';

class Connexion extends StatelessWidget {
  static const routeName = 'connexion';
  @override
  Widget build(BuildContext context) {
    final heightdevice = MediaQuery.of(context).size.height;
    final widthdevice = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: heightdevice,
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(height: heightdevice / 20),
              Container(
                height: heightdevice / 3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/coutue.png'),
                  ),
                ),
              ),
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
                    hintText: "Nom d'utlisateur",
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
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(HomePage.routeName);
                },
                child: Card(
                  color: Color.fromRGBO(56, 182, 255, 1),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Se connecter",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: heightdevice / 20),
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
              SizedBox(height: heightdevice / 10),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Inscription.routeName);
                },
                child: Container(
                  width: widthdevice / 1.2,
                  child: Text(
                    "Inscrivez vous",
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
