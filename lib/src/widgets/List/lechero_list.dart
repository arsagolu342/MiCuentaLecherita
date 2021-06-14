import 'package:flutter/material.dart';
import 'package:tu_cuenta_lecherita/src/widgets/cards/lecheros_card.dart';

class LecherosList extends StatelessWidget {
  const LecherosList({Key?  key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PatientCard(img: "f1"),
        PatientCard(img: "j1"),
        PatientCard(img: "f1"),
        PatientCard(img: "j1"),
        PatientCard(img: "f1"),
        PatientCard(img: "j1"),
        PatientCard(img: "f1"),
        PatientCard(img: "j1"),
        PatientCard(img: "f1"),
        PatientCard(img: "j1"),
        PatientCard(img: "f1"),
        PatientCard(img: "j1"),
        PatientCard(img: "f1"),
        PatientCard(img: "j1"),
      ],
    );
  }
}
