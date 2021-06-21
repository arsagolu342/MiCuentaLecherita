import 'package:flutter/material.dart';
import 'package:tu_cuenta_lecherita/src/models/milkman_models-.dart';

class LecherosPage extends StatefulWidget {
  const LecherosPage({Key? key, required this.milkman}) : super(key: key);
  final Milkman milkman;

  @override
  _LecherosPageState createState() => _LecherosPageState();
}

class _LecherosPageState extends State<LecherosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
 
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset("images/j1.jpg"),
          Text("Josselyn", style: Theme.of(context).textTheme.headline3),
          Text("22 años", style: Theme.of(context).textTheme.headline5),
        ],
      ),
    );
  }
}
