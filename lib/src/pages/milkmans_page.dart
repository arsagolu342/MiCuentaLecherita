import 'package:flutter/material.dart';
import 'package:tu_cuenta_lecherita/src/models/milkman_models-.dart';
import 'package:tu_cuenta_lecherita/src/widgets/content/milkman_details.dart';

class MilkmanPage extends StatefulWidget {
  const MilkmanPage({Key? key, required this.milkman}) : super(key: key);
  final Milkman milkman;

  @override
  _MilkmanPageState createState() => _MilkmanPageState();
}

class _MilkmanPageState extends State<MilkmanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _appBar(),
        SliverFillRemaining(
            child: MilkmanDetailsWidget(milkman: widget.milkman))
      ],
    ));
  }

  _appBar() {
    return SliverAppBar(
      title: Text(
        widget.milkman.nombre + " " + widget.milkman.apellido,
        textAlign: TextAlign.start,
        style: TextStyle(color: Colors.white, fontSize: 15),
      ),
      expandedHeight: 350.0,
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          children: [
            Container(
              height: 150.0,
              child: SingleChildScrollView(),
            ),
          ],
        ),
      ),
    );
  }
}

// Pagina que se muestra al dar click al nombre del lechero
