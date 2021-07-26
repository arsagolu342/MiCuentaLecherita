import 'package:flutter/material.dart';   
import 'package:tu_cuenta_lecherita/src/models/payment_models.dart'; 
import 'package:tu_cuenta_lecherita/src/services/payment_services.dart';
 


class PayList extends StatefulWidget {
  PayList({Key? key, required this.idmilkman}) : super(key: key);
  final String idmilkman;

  @override
  _PayListState createState() => _PayListState();
}

class _PayListState extends State<PayList> {
  PaymentService _service = new PaymentService();
  List<Payment>? _liter = [];

  @override
  void initState() {
    super.initState();
    _loadTreatments();
  }

  @override
  Widget build(BuildContext context) {
    return _liter == null
        ? reload(" Descargando la información..."):
        _liter!.length == 0
      ?  reload(" No hay Pagos registrados")
    : Card(
      color:  Color(0xFF04B8FF),
      shape: RoundedRectangleBorder(
             
              side:new  BorderSide(color: Color(0xFFFF6A14)),  
              borderRadius: new BorderRadius.all(new Radius.circular(7))), 
               
                  child: _liter!.length == 0
          ? Container(
             height: 400,
            child: Center(child: Text('Recolectando la Informacion....', textAlign: TextAlign.start, style: TextStyle(color: Colors.blue[900], fontSize: 15),),),
          
          )
          
          : Container(
            child: Column(
                
                
                children: _liter!
                
                    .map((e) => ListTile(
                          onTap: () => {},
                          title: Text( " " + e.description.toString() ),
                          subtitle:
                              Text("Fecha de la ultima recolección: " + " " +  e.fechaPago.toString()),
                               leading: Container(
                                 
                                  child: Text("Litros : " + " " +   e.total.toString()),
                                       
                               ),
                              //   trailing: Column(
                              //  children: [
                              //      Container(
                              //     child: Card(
                              //         color:  Color(0xFF94E1FF),
                              //         child:  Text("Total de litros:" + " "+ e.totalLiter.toString())
                                        
                              //     ),
                              //   ),

                              //  ],
                              // ),

                        ))
                        
                    .toList(),
                   


              ),

               
          ),
            

    );
  }

  _loadTreatments() {
    _service.getPayment(widget.idmilkman).then((value) {
      _liter = value;
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
                 Image.asset("../assets/images/carga.jpg"),
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