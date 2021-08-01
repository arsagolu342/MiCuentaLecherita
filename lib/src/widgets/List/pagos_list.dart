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
  final PaymentService _service=PaymentService();
  List<Payment>? _milkman ;

  @override
  void initState() {
    super.initState();
    _loadPayment();
  }

  Widget build(BuildContext context) {
    return _milkman == null
        ? reload(" Descargando la información..."):
    _milkman!.length == 0
      ?  reload(" No hay Lecheros registrados")
        : Padding(
          padding:  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 14.0),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              children: _milkman!.map((e) => PagosCard(payment: e)).toList(),
            ),
        );
  }

  _loadPayment() {
    _service.getPaymentList().then((value) {
      _milkman = value;
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
                 Image.asset("assets/images/pay.png",width: 150),
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