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
   double _heigth = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    
        return SliverAppBar(
            title: Text(widget.milkman.nombre + " " + widget.milkman.apellido),
            backgroundColor: Theme.of(context).canvasColor,
            pinned: true,
            expandedHeight: 350.0,
            flexibleSpace: FlexibleSpaceBar(
                background: Column(children:  [
              Container(
                  height: 150.0,
                   child: SingleChildScrollView(
                  child: Stack(
              children: [
                Column(
                  children: [
                     
                   
                SizedBox(
                  width: _width * 1,
                  height: _heigth * 0.4,
                  child: Container(
                    color: Color(0xFF04B8FF),
                    margin: new EdgeInsets.symmetric(horizontal: 20.0),
                  ),
                ),
              ],
            ),
          ],
        ),
               ), ),
            ], ),),);
  }
}