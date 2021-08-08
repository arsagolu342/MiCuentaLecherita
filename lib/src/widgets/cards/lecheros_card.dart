import 'package:flutter/material.dart';
import 'package:tu_cuenta_lecherita/src/models/milkman_models-.dart';
import 'package:tu_cuenta_lecherita/src/pages/milkmans_page.dart'; 

class LecheroCard extends StatefulWidget {
  const LecheroCard({Key? key, required this.milkman}) : super(key: key);
final Milkman milkman;

  @override
  _LecheroCardState createState() => _LecheroCardState();
}

class _LecheroCardState extends State<LecheroCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color:  Color(0xFF04B8FF),
      shape: RoundedRectangleBorder(
              side:new  BorderSide(color: Color(0xFFFF6A14)),  
              borderRadius: new BorderRadius.all(new Radius.circular(7))),
    child: ListTile(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MilkmanPage(milkman: widget.milkman),
              ));
        },
        title: Text(widget.milkman.nombre + " " + widget.milkman.apellido, style: TextStyle(color: Colors.white, fontSize: 20),),
        subtitle: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(widget.milkman.direccion, style: TextStyle(color: Colors.white ),),
        ),
         leading: ClipOval(
child: widget.milkman.photo == null
                  ? Image.asset("assets/images/user.png")
                  : Image.network(widget.milkman.photo.toString())),
         ),
     
    );
  }
}
