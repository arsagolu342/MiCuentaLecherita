import 'package:flutter/material.dart';
import 'package:tu_cuenta_lecherita/src/models/payment_models.dart'; 
class PaymentList extends StatefulWidget {
  PaymentList({Key? key  }) : super(key: key);
 
  @override
  _PaymentListState createState() => _PaymentListState();
}

class _PaymentListState extends State<PaymentList> { 
  List<Payment>? _payments = [];
  @override
  void initState() {
        super.initState(); 
  }
    @override
  Widget build(BuildContext context) {
     return _payments == null
        ? reload(" Descargando la información..."):
        _payments!.length == 0
      ?  reload(" No hay Pagos registrados")
    :Card(
      color:  Color(0xFF04B8FF),
      shape: RoundedRectangleBorder(
              side:new  BorderSide(color: Color(0xFFFF6A14)), 
              borderRadius: new BorderRadius.all(new Radius.circular(7))),     
               child: _payments!.length == 0
          ? Container(

             height: 400,
              )
          : Column(
        children: _payments!
                  .map((e) => ListTile(
                        onTap: () => {},
                        title: Text("Estado" + " " +   e.description.toString()),
                        subtitle:
                            Text("Fecha del ultimo pago" + " " +  e.fechaPago.toString()),
                             leading: Container(
                                child: Text("Total a pagar"+ " " + e.total.toString()),
                             ),
                      ))
                  .toList(),
            ),
    );
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
    }}