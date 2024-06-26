import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'graph_temp.dart';
import 'graph_pluie.dart';

class GraphTabs extends StatelessWidget {
  final temp;
  final pluie;
  final index;
  const GraphTabs({super.key,required this.temp,required this.pluie,required this.index});

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
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset("assets/icone/thermometer.json"),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset("assets/icone/raindrop.json"),
                    ],
                  ),
                ),
              ],
            ),

          )
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            GraphTempDay(points: temp.toList()[index]),
            GraphRainDay(points: pluie.toList()[index]),
          ],
        ),
      ),);
  }
}
