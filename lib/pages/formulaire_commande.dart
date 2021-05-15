import 'dart:io';

import "package:flutter/material.dart";
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../database/couture_database.dart';
import '../model/client.dart';
import '../model/commande.dart';
import 'homePage.dart';

class FormCommande extends StatefulWidget {
  final Commande commande;
  final Client client;
  static const routeName = "formulaire";

  const FormCommande({Key key, this.commande, this.client}) : super(key: key);

  @override
  _FormCommandeState createState() => _FormCommandeState();
}

class _FormCommandeState extends State<FormCommande> {
  static const itemsRappel = <String>[
    '1 jours avant',
    '2 jours avant',
    '1 semaine avant',
  ];
  final List<DropdownMenuItem<String>> _dropDownMenuItems = itemsRappel
      .map((String value) => DropdownMenuItem(value: value, child: Text(value)))
      .toList();
  String selectedVal = '2 jours avant';

  String _selectedRappel = '2 jours avant';
  DateTime _selectedDate = DateTime.now();
  TextEditingController _dateHeureLivraison = TextEditingController();
  TextEditingController _controllerDescription = TextEditingController();
  TextEditingController _controllerMontant = TextEditingController();
  TextEditingController _controlleravance = TextEditingController();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime.now(),
        lastDate: DateTime(2022));
    if (picked != null)
      setState(() {
        _selectedDate = picked;
        _dateHeureLivraison.text = DateFormat.yMd().format(_selectedDate);
      });
  }

  void _handlerappelChange(String value) {
    setState(() {
      _selectedRappel = value;
      print(value);
    });
  }

  int _resteApayer() {
    var sMontant =
        _controllerMontant.text.isEmpty ? "0" : _controllerMontant.text;
    var sAvance = _controlleravance.text.isEmpty ? "0" : _controlleravance.text;
    var montant = int.parse(sMontant);
    var avance = int.parse(sAvance);
    var result = montant - avance;
    return result;
  }

  String _setEtat() {
    return "en cours";
  }

  void _createCommande() {
    final nouvelleCommande = Commande(
        clientId: widget.client.id,
        dateHeureLivraison: _selectedDate,
        model: _model.path,
        tissu: _tissu.path,
        description: _controllerDescription.text,
        montant: _controllerMontant.text,
        avance: _controlleravance.text,
        rappel: _selectedRappel,
        etat: _setEtat());
    CoutureDataBase.instance.createCommand(nouvelleCommande);
    Navigator.pushReplacementNamed(context, HomePage.routeName);
    print(nouvelleCommande.toMap());
  }

  File _model;
  _imgFromCameraModel() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _model = image;
    });
  }

  _imgFromGalleryModel() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _model = image;
    });
  }

  File _tissu;
  _imgFromCameraTissu() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _tissu = image;
    });
  }

  _imgFromGalleryTissu() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _tissu = image;
    });
  }

  void _showPickerModel(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      _imgFromGalleryModel();
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Galerie',
                            style: TextStyle(
                                color: Color.fromRGBO(56, 182, 255, 1)),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.photo_library_outlined,
                            size: 30,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imgFromCameraModel();
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Appareil photo',
                            style: TextStyle(
                                color: Color.fromRGBO(56, 182, 255, 1)),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.camera_alt_outlined,
                            size: 30,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _showPickerTissu(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      _imgFromGalleryTissu();
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Galerie',
                            style: TextStyle(
                                color: Color.fromRGBO(56, 182, 255, 1)),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.photo_library_outlined,
                            size: 30,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imgFromCameraTissu();
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Appareil photo',
                            style: TextStyle(
                                color: Color.fromRGBO(56, 182, 255, 1)),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.camera_alt_outlined,
                            size: 30,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final widthDevice = MediaQuery.of(context).size.width;
    final heightDevice = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          'Detail commande',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              width: widthDevice / 1.2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Date et heure de livraison',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _dateHeureLivraison,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            filled: true,
                            border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.transparent, width: 0.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(56, 182, 255, 1),
                                  width: 0.5),
                            ),
                            hintText: "09/04/2021",
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.date_range,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          _selectDate(context);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: widthDevice / 1.2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rappel',
                    style: TextStyle(color: Colors.grey),
                  ),
                  DropdownButton(
                    value: _selectedRappel,
                    onChanged: _handlerappelChange,
                    items: _dropDownMenuItems,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      'Modèle ',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      onTap: () {
                        _showPickerModel(context);
                      },
                      child: _model != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.file(
                                _model,
                                height: heightDevice / 5,
                                width: heightDevice / 5,
                                fit: BoxFit.cover,
                              ),
                            )
                          : Container(
                              height: heightDevice / 5,
                              width: heightDevice / 5,
                              decoration: BoxDecoration(
                                  color: Colors.blue.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Icon(
                                Icons.camera_alt_rounded,
                                color: Colors.grey,
                                size: 25,
                              )),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Tissu ',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      onTap: () {
                        _showPickerTissu(context);
                      },
                      child: _tissu != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.file(
                                _tissu,
                                height: heightDevice / 5,
                                width: heightDevice / 5,
                                fit: BoxFit.cover,
                              ),
                            )
                          : Container(
                              height: heightDevice / 5,
                              width: heightDevice / 5,
                              decoration: BoxDecoration(
                                  color: Colors.blue.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Icon(
                                Icons.camera_alt_rounded,
                                color: Colors.grey,
                                size: 25,
                              )),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: widthDevice / 1.2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 5),
                  TextFormField(
                    maxLines: 4,
                    minLines: 4,
                    expands: false,
                    controller: _controllerDescription,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      filled: true,
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 0.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Color.fromRGBO(56, 182, 255, 1), width: 0.5),
                      ),
                      hintText: "informations suplémentaires...",
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: widthDevice / 1.2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Montant',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 5),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _controllerMontant,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      filled: true,
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 0.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Color.fromRGBO(56, 182, 255, 1), width: 0.5),
                      ),
                      hintText: "0",
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: widthDevice / 1.2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Avance',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 5),
                  TextFormField(
                    controller: _controlleravance,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      filled: true,
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 0.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Color.fromRGBO(56, 182, 255, 1), width: 0.5),
                      ),
                      hintText: "0",
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: widthDevice / 1.2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Reste a payer',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 5),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(_resteApayer().toString()),
                  ),
                  // TextFormField(
                  // //  controller: _resteApayer(),
                  //   decoration: InputDecoration(
                  //     contentPadding:
                  //         EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  //     filled: true,
                  //     border: InputBorder.none,
                  //     enabledBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(10),
                  //       borderSide:
                  //           BorderSide(color: Colors.transparent, width: 0.5),
                  //     ),
                  //     focusedBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(10),
                  //       borderSide: BorderSide(
                  //           color: Color.fromRGBO(56, 182, 255, 1), width: 0.5),
                  //     ),
                  //      hintText: _resteApayer().toString(),
                  //   ),
                  // ),
                ],
              ),
            ),
            SizedBox(height: 10),
            InkWell(
              onTap: () {
                _createCommande();
              },
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color.fromRGBO(56, 182, 255, 1),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(4, 4),
                      blurRadius: 5,
                      color: Colors.grey.withOpacity(0.3),
                    ),
                  ],
                ),
                child: Text(
                  "Enregistrer",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
