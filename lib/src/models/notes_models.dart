import 'dart:convert';
Note notesFromJson(String str) => Note.fromJson(json.decode(str));

String notesToJson(Note data) => json.encode(data.toJson());

class Note {
  Note({
    this.id,
    required this.asunt,
    required this.note,
    required this.active,
  });

  int? id;
  String asunt;
  String note;
  bool active;
  Note.create(this.asunt, this.note, this.active);
  factory Note.fromJson(Map<String, dynamic> json) => Note(
        id: json["id"],
        asunt: json["asunt"],
        note: json["note"],
        active: json["active"] == 1,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "asunt": asunt,
        "note": note,
        "active": active,
      };
}
