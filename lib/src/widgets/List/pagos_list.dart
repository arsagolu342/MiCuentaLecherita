import 'package:flutter/material.dart';
import 'package:tu_cuenta_lecherita/src/models/payment_models.dart';
import 'package:tu_cuenta_lecherita/src/services/payment_services.dart';


class PaymentList extends StatefulWidget {
  PaymentList({Key? key, required this.idmilkman}) : super(key: key);
  final String idmilkman;

  @override
  _PaymentListState createState() => _PaymentListState();
}

class _PaymentListState extends State<PaymentList> {
  PaymentService _service = new PaymentService();
  List<Payment>? _payments = [];

  @override
  void initState() {
    super.initState();
    _loadTreatments();
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
          

            child: Center(child: Text('Recolectando la Informacion....', textAlign: TextAlign.start, style: TextStyle(color: Colors.blue[900], fontSize: 15),),),
          
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

  _loadTreatments() {
    _service.getPayment(widget.idmilkman).then((value) {
      _payments = value;
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
    );}
}