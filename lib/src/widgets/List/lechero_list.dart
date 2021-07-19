import 'package:flutter/material.dart';
import 'package:tu_cuenta_lecherita/src/models/milkman_models-.dart';
import 'package:tu_cuenta_lecherita/src/services/milkman_service.dart';
import 'package:tu_cuenta_lecherita/src/widgets/cards/lecheros_card.dart';

class LecherosList extends StatefulWidget {
  const LecherosList({Key? key}) : super(key: key);

  @override
  _LecherosListState createState() => _LecherosListState();
}

class _LecherosListState extends State<LecherosList> {
  final MilkmanService _service = MilkmanService();
  List<Milkman> _milkman = [];

  @override
  void initState() {
    super.initState();
    _loadPacients();
  }

  Widget build(BuildContext context) {
    return _milkman.length == 0
        ? Container(
            height: 400,
            child: Center(
              child: Text(
                'Recolectando la Informacion....',
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.blue[900], fontSize: 15),
              ),
            ),
          )
        : Padding(
          padding:  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 14.0),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              children: _milkman.map((e) => LecheroCard(milkman: e)).toList(),
            ),
        );
  }

  _loadPacients() {
    _service.getMilkmans().then((value) {
      _milkman = value;
      setState(() {});
    });
  }
}
