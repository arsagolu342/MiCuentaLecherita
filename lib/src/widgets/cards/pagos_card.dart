import 'package:flutter/material.dart';
import 'package:tu_cuenta_lecherita/src/models/payment_models.dart';

class PagosCard extends StatelessWidget {
  const PagosCard({Key? key, required this.payment}) : super(key: key);
 
final Payment payment;
  @override
  Widget build(BuildContext context) {
    return Card(

      
     color:  Color(0xFF04B8FF),
      shape: RoundedRectangleBorder(
              side:new  BorderSide(color: Color(0xFFFF6A14)),  
              borderRadius: new BorderRadius.all(new Radius.circular(7))),
               child: ListTile(
            
          title: Text(payment.description.toString(), style: TextStyle(color: Colors.white, fontSize: 20),),
          subtitle: Text("Valor a pagar: "+ " " + payment.total.toString() +" "+"Dolares" ,style: TextStyle(color: Colors.white),),
         ),
    );
  }
}