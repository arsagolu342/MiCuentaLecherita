import 'package:flutter/material.dart';

class PatientCard extends StatelessWidget {
  const PatientCard({Key? key, required this.img}) : super(key: key);
  final String img;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
            leading: Image.asset("images/" + img + ".jpg"),
            title: Text("Paciente"),
            subtitle: Text("Esguinse de tobillo grado 2")));
  }
}
