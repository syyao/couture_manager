// To parse this JSON data, do
//
//     final commande = commandeFromMap(jsonString);

import 'dart:convert';

List<Commande> commandeFromMap(String str) =>
    List<Commande>.from(json.decode(str).map((x) => Commande.fromMap(x)));

String commandeToMap(List<Commande> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Commande {
  Commande({
    this.id,
    this.clientId,
    this.dateHeureLivraison,
    this.model,
    this.tissu,
    this.description,
    this.montant,
    this.avance,
    this.rappel,
    this.etat,
  });

  int id;
  int clientId;
  DateTime dateHeureLivraison;
  String model;
  String tissu;
  String description;
  String montant;
  String avance;
  String rappel;
  String etat;

  factory Commande.fromMap(Map<String, dynamic> json) => Commande(
        id: json["id"],
        clientId: json["clientId"],
        dateHeureLivraison: DateTime.parse(json["dateHeureLivraison"]),
        model: json["model"],
        tissu: json["tissu"],
        description: json["description"],
        montant: json["montant"],
        avance: json["avance"],
        rappel: json["rappel"],
        etat: json["etat"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "clientId": clientId,
        "dateHeureLivraison":
            "${dateHeureLivraison.year.toString().padLeft(4, '0')}-${dateHeureLivraison.month.toString().padLeft(2, '0')}-${dateHeureLivraison.day.toString().padLeft(2, '0')}",
        "model": model,
        "tissu": tissu,
        "description": description,
        "montant": montant,
        "avance": avance,
        "rappel": rappel,
        "etat": etat,
      };
}
