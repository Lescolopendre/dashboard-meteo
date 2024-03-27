import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';


class GraphRainDay extends StatelessWidget {
  final points;
  const GraphRainDay({super.key, required this.points});

  @override
  Widget build(BuildContext context) {
    List<double> times = [0,1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23];
    return Container(
      margin: const EdgeInsets.only( right: 40.0),
      child:BarChart(
        BarChartData(
          maxY: 100,
          minY: 0 ,
          barGroups: [
            for(var i=0; i<24; i++) BarChartGroupData(x: i,
              barRods: [BarChartRodData(color: Colors.blue.shade400,
                toY: points[i]+1,
              )],),
          ],
          gridData: FlGridData(
            show: false,
          ),
          borderData: FlBorderData(
              border: Border.all(color :Colors.white.withOpacity(0.3))
          ),
          titlesData: const FlTitlesData(
            topTitles: AxisTitles(
              axisNameWidget: Text("Probabilité de précipitation",style: TextStyle(fontSize: 20),),
              axisNameSize: 40,
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                getTitlesWidget: bottomTitlesWidget,
                showTitles: true,
                reservedSize: 40,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                getTitlesWidget: leftTitlesWidget,
                showTitles: true,
                interval: 25,
                reservedSize: 40,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget bottomTitlesWidget(double value, TitleMeta meta){
  const style = TextStyle(
    fontSize: 13,
    color:Colors.white,
  );
  return Text(value.toString()+"h",style: style,textAlign: TextAlign.center,);
}

Widget leftTitlesWidget(double value, TitleMeta meta){
  const style = TextStyle(
    fontSize: 12,
    color:Colors.white,
  );
  return Text(value.toString()+"%",style: style,textAlign: TextAlign.center,);
}