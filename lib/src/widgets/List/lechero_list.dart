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
  List<Milkman>? _milkman = null;

  @override
  void initState() {
    super.initState();
    _loadPacients();
  }

  Widget build(BuildContext context) {
    return _milkman == null
        ? reload(" Descargando la información..."):
    _milkman!.length == 0
      ?  reload(" No hay Lecheros registrados")
        : Padding(
          padding:  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 14.0),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              children: _milkman!.map((e) => LecheroCard(milkman: e)).toList(),
            ),
        );
  }

  _loadPacients() {
    _service.getMilkmans().then((value) {
      _milkman = value;
      setState(() {});
    });
  }

reload(  String message,) {
    return Container(
      margin: EdgeInsets.all(14.0),
      child: Center(
        child: Card(
            margin: EdgeInsets.all(14.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                 Image.asset("../assets/images/carga.jpg"),
                    Container(
                  margin: EdgeInsets.all(20.0),
                  child: Text(message,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle1),
                ),           
                    
              ],
            )),
      ),
    );
  }





}
