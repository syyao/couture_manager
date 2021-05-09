import 'package:couture_manager/model/client.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/commande.dart';

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
        db.execute(
          """CREATE TABLE client(id INTEGER PRIMARY KEY,
       nom TEXT,
        prenom TEXT, 
        telephone TEXT, 
        sexe TEXT,
         dateEntree DATETIME,
         tourPoitrine TEXT,
         tourTaille TEXT,
         tourBassin TEXT,
         tourCuisse TEXT,
         hauteurBassin TEXT,
         hauteurPoitrine TEXT,
         longueurEpaule TEXT,
         longueurBrasCoude TEXT,
         hauteurGenou TEXT,
         hauteurTaille TEXT,
         tourHanche TEXT,
         tourBras TEXT,
         longueurDos TEXT,
         longueurBras TEXT)""",
        );
        db.execute("""
    CREATE TABLE commande(id INTEGER PRIMARY KEY, 
    clientId INTEGER, 
    dateHeureLivraison DATETIME,
    model TEXT,
    tissu TEXT,
    description TEXT,
    montant TEXT, 
    avance TEXT,
    rappel TEXT,
    etat TEXT, 
    FOREIGN KEY (clientId) REFERENCES client (id))
    """);
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

  Future<List<Client>> selectedClient(Commande commande) async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db
        .query("client", where: "id = ?", whereArgs: [commande.clientId]);

    List<Client> clientListBYID =
        List.generate(maps.length, (i) => Client.fromMap(maps[i]));
    return clientListBYID;
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

  List<Client> defaultListClient = [];

  List<Commande> defaultListCommande = [];
// create commande dans la base de donnee
  void createCommand(Commande commande) async {
    final Database db = await database;
// insertion dans la table recette
    await db.insert(
      'commande',
      commande.toMap(),
      // si la recette existe deja remplacer
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Commande>> commandList() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('commande');
    List<Commande> commandeList = List.generate(maps.length, (i) {
      return Commande.fromMap(maps[i]);
    });

    if (commandeList.isEmpty) {
      for (Commande commande in defaultListCommande) {
        createCommand(commande);
      }
      commandeList = defaultListCommande;
    }

    return commandeList;
  }
//  suprimer une commande

  void deleteCommande(int id) async {
    final Database db = await database;
    db.delete("commande", where: "id = ?", whereArgs: [id]);
  }
}
