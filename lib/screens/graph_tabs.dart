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
        child: TabBar(
          tabs: [
            GraphTempDay(points: temp.toList()[0]),
            GraphRainDay(points: pluie.toList()[0]),
          ],
        ));
  }
}
