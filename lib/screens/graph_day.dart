import 'package:flutter/material.dart';
import 'dart:convert';
import '../screens/home_page.dart';
import 'package:fl_chart/fl_chart.dart';
  import 'dart:math';

class GraphDay extends StatelessWidget {
  final points;

  const GraphDay({super.key, required this.points});

  Widget graph() {
    List<double> times = [0,1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23];
    List<FlSpot> newSpots = [for (int i = 0; i < points.length; i++) FlSpot(times[i], points[i])];
    return Container(
        child: LineChart(
      LineChartData(
        maxY: (points.reduce((curr, next) => curr > next? curr: next)+3).round(),
        minY: (points.reduce((curr, next) => curr < next? curr: next)-3).round(),
        lineBarsData: [
          LineChartBarData(
            spots: newSpots,
            color: Colors.blue,
            isCurved: true,
          )
        ],
        gridData: FlGridData(
          show: false,
        ),
        titlesData: const FlTitlesData(
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
