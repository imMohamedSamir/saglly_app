import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartBody extends StatelessWidget {
  const ChartBody({super.key});

  @override
  Widget build(BuildContext context) {
    final attendanceData = [95, 92, 88, 94, 90];
    final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri'];

    return SizedBox(
      height: 240,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20), // Leaves space for labels
            child: BarChart(
              BarChartData(
                barTouchData: BarTouchData(enabled: false),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        int index = value.toInt();
                        return Text(
                          days[index],
                          style: const TextStyle(fontSize: 12),
                        );
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                gridData: FlGridData(show: true, horizontalInterval: 10),
                alignment: BarChartAlignment.spaceAround,
                maxY: 100,
                barGroups: List.generate(attendanceData.length, (index) {
                  final value = attendanceData[index].toDouble();
                  return BarChartGroupData(
                    x: index,
                    barRods: [
                      BarChartRodData(
                        toY: value,
                        color: Colors.blue,
                        width: 22,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ),
          // Top labels
          Positioned.fill(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final chartHeight = constraints.maxHeight - 40;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(attendanceData.length, (index) {
                    final percentage = attendanceData[index];
                    final topOffset = chartHeight * (1 - percentage / 100) - 12; // ABOVE the bar

                    return Padding(
                      padding: EdgeInsets.only(top: topOffset.clamp(0.0, chartHeight - 20)),
                      child: Column(
                        children: [
                          Text(
                            '$percentage%',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 4), // small spacing to bar
                        ],
                      ),
                    );
                  }),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
