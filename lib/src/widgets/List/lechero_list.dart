import 'package:flutter/material.dart';
import 'package:tu_cuenta_lecherita/src/services/milkman_service.dart';
 

class LecherosList extends StatefulWidget {
  const LecherosList({Key?  key}) : super(key: key);

  @override
  _LecherosListState createState() => _LecherosListState();
}

class _LecherosListState extends State<LecherosList> {

MilkmanService _service = MilkmanService();
@override
 void initState() {
    super.initState();
   _loadMilkmans();
  }




  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
     
      ],
    );}

     _loadMilkmans() {
    _service.getMilkmans().then((value) => print(value));
  }
}
