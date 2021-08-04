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
 