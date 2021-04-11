import 'package:couture_manager/styles/app_colors.dart';
import 'package:flutter/material.dart';

///
/// Bouton personnalisée
///
class Button extends StatelessWidget {
  // Fonction lorsqu'on touche le bouton
  final Function onTap;
  // Le texte du bouton
  final String text;

  const Button({Key key, this.onTap, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Card(
        color: AppColors.blueColor,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
