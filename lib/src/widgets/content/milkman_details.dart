  
import 'package:flutter/material.dart';
 
 class MilkmanDetailsWidget extends StatefulWidget{

   const MilkmanDetailsWidget({Key? key}) : super(key: key);
  @override
  _MilkmanDetailsWidgetState createState() => _MilkmanDetailsWidgetState();
 }

 class   _MilkmanDetailsWidgetState extends State<  MilkmanDetailsWidget>
    with SingleTickerProviderStateMixin {
  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Detalles'),
    Tab(text: 'Terapias'),
    Tab(text: 'Alergias'),
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
        children: myTabs.map((Tab tab) {
          final String label = tab.text!.toLowerCase();
          return Center(
            child: Text(
              'This is the $label tab',
              style: const TextStyle(fontSize: 36),
            ),
          );
        }).toList(),
      ),
    );
  }
}