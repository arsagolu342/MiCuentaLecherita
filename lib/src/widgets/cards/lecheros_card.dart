import 'package:flutter/material.dart';
import 'package:tu_cuenta_lecherita/src/models/milkman_models-.dart';
import 'package:tu_cuenta_lecherita/src/pages/lecheros_page.dart';

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
                builder: (context) => LecherosPage(milkman: milkman),
              ));
        },
        title: Text(milkman.nombre + " " + milkman.apellido, style: TextStyle(color: Colors.white, fontSize: 20),),
        subtitle: Text(milkman.direccion, style: TextStyle(color: Colors.white ),),
        leading:  FadeInImage(
                placeholder: AssetImage('images/user.png'),
                image: NetworkImage(milkman.photo.toString())),
    ),
    );
  }
}
