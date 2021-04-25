// To parse this JSON data, do
//
//     final utilisateur = utilisateurFromMap(jsonString);

import 'dart:convert';

List<Utilisateur> utilisateurFromMap(String str) =>
    List<Utilisateur>.from(json.decode(str).map((x) => Utilisateur.fromMap(x)));

String utilisateurToMap(List<Utilisateur> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Utilisateur {
  Utilisateur({
    this.id,
    this.nom,
    this.prenom,
    this.telephone,
    this.email,
    this.dateDeNaiSSance,
    this.motDePasse,
  });

  int id;
  String nom;
  String prenom;
  int telephone;
  String email;
  DateTime dateDeNaiSSance;
  String motDePasse;

  factory Utilisateur.fromMap(Map<String, dynamic> json) => Utilisateur(
        id: json["id"],
        nom: json["nom"],
        prenom: json["prenom"],
        telephone: json["telephone"],
        email: json["email"],
        dateDeNaiSSance: DateTime.parse(json["dateDeNaiSSance"]),
        motDePasse: json["motDePasse"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nom": nom,
        "prenom": prenom,
        "telephone": telephone,
        "email": email,
        "dateDeNaiSSance":
            "${dateDeNaiSSance.year.toString().padLeft(4, '0')}-${dateDeNaiSSance.month.toString().padLeft(2, '0')}-${dateDeNaiSSance.day.toString().padLeft(2, '0')}",
        "motDePasse": motDePasse,
      };
}
