import 'package:flutter/material.dart';

///
/// Zone de saisie customisée
///
class InputText extends StatelessWidget {
  // Un controller pour le [TextField]
  final TextEditingController controller;

  // Un placeholder
  final String hintText;

  // Définit si c'est un champ 'mot de passe' pour cacher les caracteres et afficher l'icone d'oeil
  final bool isPassword;

  // L'icone de droite de la zone de saisie
  final Widget suffixIcon;

  const InputText({
    Key key,
    this.controller,
    this.hintText,
    this.isPassword = false,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        obscureText: isPassword,
        controller: controller,
        maxLines: 1,
        decoration: InputDecoration(
          suffixIcon: isPassword
              ? Icon(
                  Icons.visibility_off,
                  size: 18,
                )
              : suffixIcon,
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          filled: true,
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Color.fromRGBO(56, 182, 255, 1), width: 0.5),
          ),
          hintText: hintText,
        ),
      ),
    );
  }
}
