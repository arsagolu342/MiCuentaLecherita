import 'package:flutter/material.dart'; 
import 'package:tu_cuenta_lecherita/src/models/payment_models.dart'; 
import 'package:tu_cuenta_lecherita/src/services/payment_services.dart';
 


class PayFormList extends StatefulWidget {
  PayFormList({Key? key, required this.idmilkman}) : super(key: key);
  final String idmilkman;

  @override
  _PayFormListState createState() => _PayFormListState();
}

class _PayFormListState extends State<PayFormList> {
  PaymentService _service = new PaymentService();
  List<Payment>? _pay = [];

  @override
  void initState() {
    super.initState();
    _loadTreatments();
  }

  @override
  Widget build(BuildContext context) {
    return _pay == null
        ? reload(" Descargando la información..."):
        _pay!.length == 0
      ?  reload(" No hay Litros registrados")
    : Card(
      color:  Color(0xFF04B8FF),
      shape: RoundedRectangleBorder(
             
              side:new  BorderSide(color: Color(0xFFFF6A14)),  
              borderRadius: new BorderRadius.all(new Radius.circular(7))), 
               
                  child: _pay!.length == 0
          ? Container(
             height: 400,
            child: Center(child: Text('Recolectando la Informacion....', textAlign: TextAlign.start, style: TextStyle(color: Colors.blue[900], fontSize: 15),),),
          
          )
          
          : Container(
            child: Column(
                
                
                children: _pay!
                
                    .map((e) => ListTile(
                          onTap: () => {},
                          title: Text( " " + e.description.toString(),style: TextStyle(color: Colors.white, fontSize: 15), ),
                          subtitle:
                              Text("Fecha de pago: " + " " +  e.fechaPago.toString(),style: TextStyle(color: Colors.white, fontSize: 15),),
                               leading: Container(
                                 
                                  child: Text("Pago : " + " " +   e.subtotal.toString(),style: TextStyle(color: Colors.blueGrey, fontSize: 15),),
                                       
                               )

                        ))
                        
                    .toList(),
                   


              ),

               
          ),
            

    );
  }

  _loadTreatments() {
    _service.getPayment(widget.idmilkman).then((value) {
      _pay = value;
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
                 Image.asset("../assets/images/pay.png"),
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