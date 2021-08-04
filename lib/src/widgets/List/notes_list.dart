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
  void initState() {
    super.initState();
   final notePrder = Provider.of<NoteProvider>(context, listen: false);
    notePrder.loadElements();

  }


  Widget build(BuildContext context) {
    final notePrder = Provider.of<NoteProvider>(context, listen: false); 
    return notePrder.elements.length == 0
        ? Center(
            child: Container(
                height: 100, width: 100, child: CircularProgressIndicator()))
        : ListView.builder(
            shrinkWrap: true,
            itemCount: notePrder.elements.length,
            itemBuilder: (_, index) => Card(
                child: ListTile(
                    leading: Icon(Icons.speaker_notes, color: Colors.blue[900]),
                    title: Text(notePrder.elements[index].asunt,
                        style:
                            TextStyle(color: Colors.blue[900], fontSize: 20)),
                    subtitle: Text(notePrder.elements[index].note),
                    trailing: notePrder.elements[index].active
                        ? Icon(Icons.check_circle, color: Colors.blue[900])
                        : Icon(Icons.radio_button_unchecked, color: Colors.blue[900]))));
  }
}
