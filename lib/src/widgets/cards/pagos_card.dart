import 'package:flutter/material.dart';

class PagosCard extends StatelessWidget {
  const PagosCard({Key? key, required this.user}) : super(key: key);
  final String user;

  @override
  Widget build(BuildContext context) {
    return Card(

      
     color:  Color(0xFF04B8FF),
      shape: RoundedRectangleBorder(
              side:new  BorderSide(color: Color(0xFFFF6A14)),  
              borderRadius: new BorderRadius.all(new Radius.circular(7))),
               child: ListTile(
           leading: Image.asset("../assets/images/" + user + ".png"),
          title: Text("Pagos ", style: TextStyle(color: Colors.white, fontSize: 20),),
          subtitle: Text("30 Litros por pagar",style: TextStyle(color: Colors.white),),
         ),
    );
  }
}