import 'package:flutter/material.dart';
import 'package:tu_cuenta_lecherita/src/widgets/List/lechero_list.dart';

class MilkmanWidget extends StatefulWidget {
  const MilkmanWidget({Key? key}) : super(key: key);

  @override
  _PatientsWidgetState createState() => _PatientsWidgetState();
}

class _PatientsWidgetState extends State<MilkmanWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        
        child: LecherosList()
    
    );
 
                   
  }
}