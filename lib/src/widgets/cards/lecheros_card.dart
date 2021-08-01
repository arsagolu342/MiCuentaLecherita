import 'package:flutter/material.dart';
import 'package:tu_cuenta_lecherita/src/models/milkman_models-.dart';
import 'package:tu_cuenta_lecherita/src/pages/milkmans_page.dart'; 

class LecheroCard extends StatelessWidget {
  const LecheroCard({Key? key, required this.milkman}) : super(key: key);
final Milkman milkman;

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
                builder: (context) => MilkmanPage(milkman: milkman),
              ));
        },
        title: Text(milkman.nombre + " " + milkman.apellido, style: TextStyle(color: Colors.white, fontSize: 20),),
        subtitle: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(milkman.direccion, style: TextStyle(color: Colors.white ),),
        ),
         leading: ClipOval(
child: milkman.photo == null
                  ? Image.asset("assets/images/user.png")
                  : Image.network(milkman.photo.toString())),
         ),
     
    );
  }
}
