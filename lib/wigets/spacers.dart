import 'package:flutter/material.dart';

///
/// Séparateurs verticaux et horizontaux utilisant [SizedBox] dans
/// son fonctionnement
///`

///
/// Séparateur vertical
///
class VSpacer {
  VSpacer._();

  static SizedBox get medium => SizedBox(height: 10);

  static SizedBox get large => SizedBox(height: 20);
}

///
/// Séparateur horizontal
///
class HSpacer {
  HSpacer._();

  static SizedBox get medium => SizedBox(width: 10);
}
