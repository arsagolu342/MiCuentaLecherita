import 'package:flutter/material.dart'; 
import 'package:tu_cuenta_lecherita/src/models/payment_models.dart'; 
import 'package:tu_cuenta_lecherita/src/services/payment_services.dart'; 
import 'package:tu_cuenta_lecherita/src/widgets/cards/pagos_card.dart';

class PaymentList extends StatefulWidget {
  const PaymentList({Key? key}) : super(key: key);

  @override
  _PaymentListState createState() => _PaymentListState();
}

class _PaymentListState extends State<PaymentList> {
  final PaymentService _service = PaymentService();
  List<Payment>? _payment = null;

  @override
  void initState() {
    super.initState();
    _loadPacients();
  }

  Widget build(BuildContext context) {
    return _payment == null
        ? reload(" Descargando la información..."):
    _payment!.length == 0
      ?  reload(" No hay Lecheros registrados")
        : Padding(
          padding:  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 14.0),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              children: _payment!.map((e) =>  PagosCard(payment: e)).toList(),
            ),
        );
  }

  _loadPacients() {
    _service.getPaymentList().then((value) {
      _payment = value;
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



// import 'package:flutter/material.dart';
// import 'package:tu_cuenta_lecherita/src/widgets/cards/pagos_card.dart';
 
// class PagosList extends StatelessWidget {
//   const PagosList({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
      
//       children: [
//         PagosCard(user: "user"),
//         PagosCard(user: "user"),
//         PagosCard(user: "user"),
//         PagosCard(user: "user"),
//         PagosCard(user: "user"),
//         PagosCard(user: "user"),
//         PagosCard(user: "user"),
//         PagosCard(user: "user"),
//         PagosCard(user: "user"),
//         PagosCard(user: "user"),
//         PagosCard(user: "user"),
//         PagosCard(user: "user"),
//         PagosCard(user: "user"),
//         PagosCard(user: "user"),
//       ],
//     );
//   }
// }