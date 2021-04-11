import 'package:couture_manager/wigets/button.dart';
import 'package:couture_manager/wigets/input/input_text.dart';
import 'package:couture_manager/wigets/spacers.dart';

import 'connexion_page.dart';
import '../homePage.dart';
import 'package:flutter/material.dart';

class Inscription extends StatelessWidget {
  static const routeName = 'inscription';

  @override
  Widget build(BuildContext context) {
    final heightDevice = MediaQuery.of(context).size.height;
    final widthdevice = MediaQuery.of(context).size.width;
    final longestSide = MediaQuery.of(context).size.longestSide;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Image.asset(
                  "images/coutue.png",
                  height: heightDevice / 4,
                ),
                Row(
                  children: [
                    Expanded(
                      child: InputText(
                        hintText: "Nom",
                      ),
                    ),
                    HSpacer.medium,
                    Expanded(
                      child: InputText(
                        hintText: "Prénoms",
                      ),
                    ),
                  ],
                ),
                VSpacer.medium,
                InputText(hintText: "Date de naissace"),
                VSpacer.medium,
                InputText(hintText: "Email"),
                VSpacer.medium,
                InputText(
                  hintText: "Mot de passe",
                  isPassword: true,
                ),
                VSpacer.medium,
                InputText(
                  hintText: "Confirmer mot de passe",
                  isPassword: true,
                ),
                VSpacer.large,
                Button(
                  onTap: () {
                    Navigator.of(context).pushNamed(HomePage.routeName);
                  },
                  text: "S'inscrire",
                ),
                VSpacer.large,
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Connexion.routeName);
                    },
                    child: Text(
                      "Connectez-vous ?",
                      textAlign: TextAlign.right,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
