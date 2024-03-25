import 'package:flutter/material.dart';
import 'graph_temp.dart';
import 'graph_pluie.dart';

class GraphTabs extends StatelessWidget {
  final temp;
  final pluie;
  const GraphTabs({super.key,required this.temp,required this.pluie});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
      child: Scaffold(

        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.thermostat)),
              Tab(icon: Icon(Icons.water_drop)),
            ],
          ),
          )
        ),
        body: TabBarView(
          children: [
            GraphTempDay(points: temp.toList()[0]),
            GraphRainDay(points: pluie.toList()[0]),
          ],
        ),
      ),);
  }
}
