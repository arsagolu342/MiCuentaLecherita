import 'package:flutter/material.dart';
import 'package:tu_cuenta_lecherita/src/models/milkman_models-.dart';
import 'package:tu_cuenta_lecherita/src/widgets/List/literMilk_list.dart';
import 'package:tu_cuenta_lecherita/src/widgets/List/pagos_list.dart'; 


class MilkmanDetailsWidget extends StatefulWidget {
  const MilkmanDetailsWidget({Key? key, required this.milkman})
      : super(key: key);
  final Milkman milkman;

  @override
  _MilkmanDetailsWidgetState createState() => _MilkmanDetailsWidgetState();
}

class _MilkmanDetailsWidgetState extends State<MilkmanDetailsWidget>
    with SingleTickerProviderStateMixin {
  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Detalles'),
    Tab(text: 'Historial de Litros'),
    Tab(text: 'Pagos' ),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TabBar(
        labelColor: Theme.of(context).primaryColor,
        controller: _tabController,
        tabs: myTabs,
      ),
      body: TabBarView(
        controller: _tabController,
        children: [_detail(),_historial(), _payments()],
      ),
    );
  }

  _detail() {
    return Column(
      
    );
  }
_historial(){

   return Column(

     
      children: [

          Expanded(
            child: SingleChildScrollView(
                child: LiterMilkList(idmilkman: widget.milkman.idmilkman))),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child:  FloatingActionButton(
              onPressed: () => {},
              child: const Icon(Icons.add_chart_outlined),
              ),
        ),
      ],

      
    );
}
  _payments() {
   
    return Column(
      children: [
        // Padding(
        //   padding: const EdgeInsets.symmetric(vertical: 14.0),
        //   child: ElevatedButton.icon(
        //       onPressed: () => {},
        //       icon: Icon(Icons.add_box, color: _color),
        //       label: Container(
        //         padding: const EdgeInsets.symmetric(vertical: 7.0),
        //         // child: Text("Agregar nuevo",
        //         //     style: Theme.of(context)
        //         //         .textTheme
        //         //         .bodyText1
        //         //         ?.apply(color: _color)),
        //       )),
        // ),
        Expanded(
            child: SingleChildScrollView(
                child: PaymentList(idmilkman: widget.milkman.idmilkman))),
                Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child:  FloatingActionButton(
              onPressed: () => {},
              child: const Icon(Icons.payment_outlined),
              ),
        ),
      ],
    );
  }
}