import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hodory/core/theming/color_manager.dart';
import 'package:hodory/core/theming/text_styles.dart';
import 'package:hodory/features/ReportsView/Presentaion/manager/cubit/report_cubit.dart';
import 'package:hodory/features/ReportsView/data/models/weekly_attendance_model.dart';

class ReportAttendanceTable extends StatelessWidget {
  const ReportAttendanceTable({super.key});

  @override
  Widget build(BuildContext context) {
    Color getColor(double percent) {
      if (percent >= 95.0) return Colors.green;
      if (percent < 90.0) return Colors.red;
      return Colors.blue;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Text(
            'Detailed Attendance',
            style: AppTextStyles.medium16.copyWith(
              color: ColorManager.lightText,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: BlocBuilder<ReportCubit, ReportState>(
            builder: (context, state) {
              final List<WeeklyAttendanceModel> allDays =
                  state is ReportSuccess ? state.allDays : [];
              return Column(
                children: [
                  _buildHeaderRow(),
                  const Divider(height: 1),
                  ...allDays.asMap().entries.map((entry) {
                    final index = entry.key;
                    final data = entry.value;
                    final bgColor =
                        index % 2 == 0 ? Colors.white : Colors.grey.shade100;
                    return Container(
                      color: bgColor,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(data.day),
                          Text('${data.present}'),
                          Text('${data.absent}'),
                          Text(
                            '${(data.percentage)}%',
                            style: TextStyle(
                              color: getColor(data.percentage.toDouble()),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildHeaderRow() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      color: Colors.grey.shade200,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Date', style: TextStyle(fontWeight: FontWeight.w600)),
          Text('Present', style: TextStyle(fontWeight: FontWeight.w600)),
          Text('Absent', style: TextStyle(fontWeight: FontWeight.w600)),
          Text('%', style: TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
