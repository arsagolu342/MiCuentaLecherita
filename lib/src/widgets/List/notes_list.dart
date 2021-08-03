import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tu_cuenta_lecherita/src/providers/note_providers.dart'; 
class NoteList extends StatefulWidget {
  NoteList({Key? key}) : super(key: key);

  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  @override
  Widget build(BuildContext context) {
    final notePrder =
        Provider.of<NoteProvider>(context, listen: false);
    notePrder.loadElements();

    return notePrder.elements.length == 0
        ? Center(
            child: Container(
                height: 100, width: 100, child: CircularProgressIndicator()))
        : ListView.builder(
            shrinkWrap: true,
            itemCount: notePrder.elements.length,
            itemBuilder: (_, index) => Card(
                child: ListTile(
                    leading: Icon(Icons.medical_services),
                    title: Text(notePrder.elements[index].asunt),
                    subtitle: Text(notePrder.elements[index].note),
                    trailing: notePrder.elements[index].active
                        ? Icon(Icons.radio_button_checked)
                        : Icon(Icons.radio_button_unchecked))));
  }
}