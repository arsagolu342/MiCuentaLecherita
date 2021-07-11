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
  List<Payment> _payments = [];

  @override
  void initState() {
    super.initState();
    _loadTreatments();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 7.0),
      child: _payments.length == 0
          ? Container()
          : Column(
              children: _payments
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
}