import 'package:flutter/material.dart';
import 'package:tu_cuenta_lecherita/src/widgets/List/test_list.dart';
 

class HomeWidget extends StatefulWidget {
  HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}
 
class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    double _heigth = MediaQuery.of(context).size.height;
    print("Altura:$_heigth");

    return Column(
      mainAxisSize: MainAxisSize.min,
      
      children: [
        
        Text("Pagos Pendientes", textAlign: TextAlign.center, style: TextStyle(color: Colors.blue[900], fontSize: 15),),
        Expanded(child: SingleChildScrollView(child: PaymentList()))
      ],
    );
  }
}
 