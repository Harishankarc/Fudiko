import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class OrderDonut extends StatelessWidget {
  final double done;
  final double total;
  final Color? mainColor;
  final Color? secondaryColor;

  const OrderDonut({super.key, required this.done, required this.total, this.mainColor, this.secondaryColor});

  @override
  Widget build(BuildContext context) {
    double remaining = total - done;

    return Stack(
      alignment: Alignment.center,
      children: [
        PieChart(
          PieChartData(
            sectionsSpace: 0,
            centerSpaceRadius: 50,
            startDegreeOffset: -90,
            sections: [
              PieChartSectionData(
                value: done,
                color: mainColor ?? Colors.deepOrange,
                radius: 50,
                title: '',
              ),
              PieChartSectionData(
                value: remaining,
                color: secondaryColor ?? Colors.deepOrange.shade100,
                radius: 50,
                title: '',
              ),
            ],
          ),
        ),
        Text(
          '${done.toInt()}',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
