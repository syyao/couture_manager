import 'package:couture_manager/wigets/button.dart';
import 'package:couture_manager/wigets/input/input_text.dart';
import 'package:couture_manager/wigets/spacers.dart';
import 'package:flutter/material.dart';

import '../homePage.dart';
import 'inscription_page.dart';

class Connexion extends StatelessWidget {
  static const routeName = 'connexion';

  @override
  Widget build(BuildContext context) {
    final heightDevice = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset(
                "images/coutue.png",
                height: heightDevice / 4,
              ),
              InputText(
                hintText: "Nom d'utilisateur",
              ),
              VSpacer.medium,
              InputText(
                hintText: "Mot de passe",
                isPassword: true,
              ),
              VSpacer.large,
              Button(
                onTap: () {
                  Navigator.of(context).pushNamed(HomePage.routeName);
                },
                text: "Se connecter",
              ),
              VSpacer.large,
              Text(
                "Continuer avec",
              ),
              VSpacer.large,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/gle.png',
                    width: 50,
                    height: 50,
                  ),
                  Image.asset(
                    'images/apple.png',
                    width: 70,
                    height: 70,
                  )
                ],
              ),
              VSpacer.large,
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Inscription.routeName);
                  },
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
