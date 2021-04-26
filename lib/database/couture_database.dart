import 'package:couture_manager/model/client.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CoutureDataBase {
  CoutureDataBase._();
  static final CoutureDataBase instance = CoutureDataBase._();
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    WidgetsFlutterBinding.ensureInitialized();
    return await openDatabase(
      join(await getDatabasesPath(), 'couture_database.db'),
      onCreate: (db, version) {
        return db.execute(
          // creation de la table client
          "CREATE TABLE client(id INTEGER PRIMARY KEY, nom TEXT, prenom TEXT, telephone INT, sexe TEXT, dateEntree DATETIME,tourPoitrine INT,tourTaille INT,tourBassin INT,tourCuisse INT,hauteurBassin INT,hauteurPoitrine INT,longueurEpaule INT,longueurBrasCoude INT,hauteurGenou INT,hauteurTaille INT,tourHanche INT,tourBras INT,longueurDos INT,longueurBras INT)",
        );
      },
      version: 1,
    );
  }

// insertion dans la base de donnee
  void insertClient(Client client) async {
    final Database db = await database;
// insertion dans la table recette
    await db.insert(
      'client',
      client.toMap(),
      // si la recette existe deja remplacer
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

// modifier une valeur dans la base de donnee
  void updateclient(Client client) async {
    final Database db = await database;
    // cle primaire
    await db.update("client", client.toMap(),
        where: "id = ?", whereArgs: [client.id]);
  }

// suprimer une recette dans ma base de donnee
  void deleteClient(int id) async {
    final Database db = await database;
    db.delete("client", where: "id = ?", whereArgs: [id]);
  }

// methode pour recuperer la liste de recette dans ma base de donnée
  Future<List<Client>> clientList() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('client');
    List<Client> clientList = List.generate(maps.length, (i) {
      return Client.fromMap(maps[i]);
    });

    if (clientList.isEmpty) {
      for (Client client in defaultListClient) {
        insertClient(client);
      }
      clientList = defaultListClient;
    }

    return clientList;
  }

  List<Client> defaultListClient = [
    Client(
      id: 1,
      nom: "Yao",
      prenom: "Sydney",
      dateEntree: DateTime.now(),
      sexe: "H",
      telephone: "0123456789",
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
      sexe: "F",
      telephone: "0123456789",
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
}
