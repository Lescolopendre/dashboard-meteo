import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';


class GraphTempDay extends StatelessWidget {
  final points;
  const GraphTempDay({super.key, required this.points});
  @override
  Widget build(BuildContext context) {
    List<double> times = [0,1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23];
    List<FlSpot> newSpots = [for (int i = 0; i < points.length; i++) FlSpot(times[i], points[i])];
    return Container(
      margin: const EdgeInsets.only( right: 40.0),
      child:LineChart(
      LineChartData(
        maxY: (points.reduce((curr, next) => curr > next? curr: next)+3).round(),
        minY: (points.reduce((curr, next) => curr < next? curr: next)-3).round(),
        lineBarsData: [
            LineChartBarData(
              barWidth:1.0,
              spots: newSpots,
              color: Colors.white,
              isCurved: true,
            ),
          ],
          gridData: FlGridData(
            show: false,
          ),
          borderData: FlBorderData(
            border: Border.all(color :Colors.white.withOpacity(0.3))
          ),
          titlesData: const FlTitlesData(
            topTitles: AxisTitles(
              axisNameWidget: Text("Température du jour",
                style: TextStyle(fontSize: 15,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Roboto',
                  color: Colors.white60,

                ),),
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
                interval: 2,
                reservedSize: 40,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                getTitlesWidget: leftTitlesWidget,
                showTitles: true,
                interval: 100,
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
  return Text(value.toString()+"°C",style: style,textAlign: TextAlign.center,);
}