import 'package:flutter/material.dart';
import 'package:tu_cuenta_lecherita/src/widgets/cards/pagos_card.dart';
 
class PagosList extends StatelessWidget {
  const PagosList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: [
        PagosCard(user: "user"),
        PagosCard(user: "user"),
        PagosCard(user: "user"),
        PagosCard(user: "user"),
        PagosCard(user: "user"),
        PagosCard(user: "user"),
        PagosCard(user: "user"),
        PagosCard(user: "user"),
        PagosCard(user: "user"),
        PagosCard(user: "user"),
        PagosCard(user: "user"),
        PagosCard(user: "user"),
        PagosCard(user: "user"),
        PagosCard(user: "user"),
      ],
    );
  }
}