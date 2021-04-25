// To parse this JSON data, do
//
//     final client = clientFromMap(jsonString);

import 'dart:convert';

List<Client> clientFromMap(String str) =>
    List<Client>.from(json.decode(str).map((x) => Client.fromMap(x)));

String clientToMap(List<Client> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Client {
  Client({
    this.id,
    this.utilisateurId,
    this.nom,
    this.prenom,
    this.telephone,
    this.sexe,
    this.dateEntree,
    //mesure
    this.tourPoitrine,
    this.tourTaille,
    this.tourBassin,
    this.tourCuisse,
    this.hauteurBassin,
    this.hauteurPoitrine,
    this.longueurEpaule,
    this.longueurBrasCoude,
    this.hauteurGenou,
    this.hauteurTaille,
    this.tourHanche,
    this.tourBras,
    this.longueurDos,
    this.longueurBras,
  });

  int id;
  int utilisateurId;
  String nom;
  String prenom;
  String telephone;
  String sexe;
  DateTime dateEntree;
  //mesure

  String tourPoitrine;
  String tourTaille;
  String tourBassin;
  String tourCuisse;
  String hauteurBassin;
  String hauteurPoitrine;
  String longueurEpaule;
  String longueurBrasCoude;
  String hauteurGenou;
  String hauteurTaille;
  String tourHanche;
  String tourBras;
  String longueurDos;
  String longueurBras;

  factory Client.fromMap(Map<String, dynamic> json) => Client(
        id: json["id"],
        utilisateurId: json["utilisateurId"],
        nom: json["nom"],
        prenom: json["prenom"],
        telephone: json["telephone"],
        sexe: json["sexe"],
        dateEntree: DateTime.parse(
          json["dateEntree"],
        ),
        tourPoitrine: json["tourPoitrine"],
        tourTaille: json["tourTaille"],
        tourBassin: json["tourBassin"],
        tourCuisse: json["tourCuisse"],
        hauteurBassin: json["hauteurBassin"],
        hauteurPoitrine: json["hauteurPoitrine"],
        longueurEpaule: json["longueurEpaule"],
        longueurBrasCoude: json["longueurBrasCoude"],
        hauteurGenou: json["hauteurGenou"],
        hauteurTaille: json["hauteurTaille"],
        tourHanche: json["tourHanche"],
        tourBras: json["tourBras"],
        longueurDos: json["longueurDos"],
        longueurBras: json["longueurBras"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "utilisateurId": utilisateurId,
        "nom": nom,
        "prenom": prenom,
        "telephone": telephone,
        "sexe": sexe,
        "dateEntree":
            "${dateEntree.year.toString().padLeft(4, '0')}-${dateEntree.month.toString().padLeft(2, '0')}-${dateEntree.day.toString().padLeft(2, '0')}",
        "tourPoitrine": tourPoitrine,
        "tourTaille": tourTaille,
        "tourBassin": tourBassin,
        "tourCuisse": tourCuisse,
        "hauteurBassin": hauteurBassin,
        "hauteurPoitrine": hauteurPoitrine,
        "longueurEpaule": longueurEpaule,
        "longueurBrasCoude": longueurBrasCoude,
        "hauteurGenou": hauteurGenou,
        "hauteurTaille": hauteurTaille,
        "tourHanche": tourHanche,
        "tourBras": tourBras,
        "longueurDos": longueurDos,
        "longueurBras": longueurBras,
      };
}

List<Client> listCLients = [
  Client(
    id: 1,
    nom: "Yao",
    prenom: "Sydney",
    dateEntree: DateTime.now(),
    // sexe: "H",
    telephone: '0123456789',
    utilisateurId: 1,
    hauteurBassin: "123",
    hauteurGenou: "67",
    hauteurPoitrine: "89",
    hauteurTaille: "32",
    longueurBras: "39",
    longueurBrasCoude: "32",
    longueurDos: "12",
    longueurEpaule: "33",
    tourPoitrine: "11",
    tourHanche: "87",
    tourBassin: "54",
    tourBras: "56",
    tourCuisse: "78",
    tourTaille: "62",
  ),
  Client(
    id: 2,
    nom: "Domi",
    prenom: "Chelida",
    dateEntree: DateTime.now(),
    //  sexe: "F",
    telephone: '0123456789',
    utilisateurId: 1,
    hauteurBassin: "0",
    hauteurGenou: "0",
    hauteurPoitrine: "0",
    hauteurTaille: "0",
    longueurBras: "0",
    longueurBrasCoude: "0",
    longueurDos: "0",
    longueurEpaule: "0",
    tourPoitrine: "0",
    tourHanche: "0",
    tourBassin: "0",
    tourBras: "0",
    tourCuisse: "0",
    tourTaille: "0",
  ),
];
