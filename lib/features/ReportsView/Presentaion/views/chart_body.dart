import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hodory/core/theming/color_manager.dart';
import 'package:hodory/features/ReportsView/Presentaion/manager/cubit/report_cubit.dart';
import 'package:hodory/features/ReportsView/data/models/weekly_attendance_model.dart';

class ChartBody extends StatelessWidget {
  const ChartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: BlocBuilder<ReportCubit, ReportState>(
        builder: (context, state) {
          final List<WeeklyAttendanceModel> weekly =
              state is ReportSuccess ? state.weekly : [];
          final List days = weekly.map((e) => e.day).toList();
          final List<int> percentage = weekly.map((e) => e.percentage).toList();
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ), // Leaves space for labels
                child: BarChart(
                  BarChartData(
                    barTouchData: const BarTouchData(enabled: false),
                    titlesData: FlTitlesData(
                      leftTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
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
                    gridData: const FlGridData(
                      show: true,
                      horizontalInterval: 15,
                    ),
                    alignment: BarChartAlignment.spaceAround,
                    maxY: 100,

                    barGroups: List.generate(percentage.length, (index) {
                      final value = percentage[index].toDouble();
                      return BarChartGroupData(
                        x: index,
                        barRods: [
                          BarChartRodData(
                            toY: value,
                            color: ColorManager.primary,
                            width: 26,
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
                      children: List.generate(percentage.length, (index) {
                        final value = percentage[index];
                        final topOffset = chartHeight * (1 - value / 100) - 12;

                        return Padding(
                          padding: EdgeInsets.only(
                            top: topOffset.clamp(0.0, chartHeight - 20),
                          ),
                          child: Column(
                            children: [
                              Text(
                                '$value%',
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 4),
                            ],
                          ),
                        );
                      }),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
