import 'package:flutter/material.dart';
import 'package:tu_cuenta_lecherita/src/models/notes_models.dart';
import 'package:tu_cuenta_lecherita/src/providers/db_providers.dart';
 

class NoteProvider extends ChangeNotifier {
  List<Note> elements = [];

  Future<Note> addElement(String asunt, String note, bool active) async {
    Note element = Note(asunt:asunt, note: note, active: active);
    final id = await DBProvider.db.insert(element);
    element.id = id;
    this.elements.add(element);
    notifyListeners();
    return element;
  }

  loadElements() async {
    final travelsQuery = await DBProvider.db.list();
    this.elements = [...travelsQuery];
    notifyListeners();
  }
}



// import 'package:flutter/material.dart';
// import 'package:tu_cuenta_lecherita/src/models/notes_models.dart';

// import 'db_providers.dart'; 

// class NoteProvider extends ChangeNotifier {
//   List<Note> notes = [];
// //interactua con algunas instancias del proyecto 
//   Future<Note> addElement(String asunt, String note, bool active) async {
//     Note item = Note(asunt: asunt, note: note, active: active);
//     final id = await DBProvider.db.insert(item);
//     item.id = id;
//     this.notes.add(item);
//     notifyListeners();
//     return item;
//   }
// //Lista los elementos de la base de datos interna y notifica a los escucha
//   loadElements() async {
//     final travelsQuery = await DBProvider.db.list();
//     this.notes = [...travelsQuery];
//     notifyListeners();
//   }
// }