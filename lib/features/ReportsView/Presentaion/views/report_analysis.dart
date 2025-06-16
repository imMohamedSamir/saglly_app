import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hodory/core/theming/color_manager.dart';
import 'package:hodory/core/theming/text_styles.dart';
import 'package:hodory/features/ReportsView/Presentaion/manager/cubit/report_cubit.dart';
import 'package:hodory/features/attendanceView/data/models/header_analysis_model.dart';

class ReportAnalysis extends StatelessWidget {
  const ReportAnalysis({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportCubit, ReportState>(
      builder: (context, state) {
        if (state is ReportSuccess) {
          final data = [
            HeaderAnalysisModel(
              title: 'total students',
              count: state.totalStudents,
              icon: const Icon(Icons.school),
            ),
            HeaderAnalysisModel(
              title: 'Present',
              count: state.presentPercentage,
              icon: const Icon(Icons.check_circle, color: Colors.green),
            ),
            HeaderAnalysisModel(
              title: 'Absent',
              count: state.absentPercentage,
              icon: const Icon(Icons.close_rounded, color: Colors.red),
            ),
          ];
          return _buildStatsCard(data);
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Widget _buildStatsCard(List<HeaderAnalysisModel> options) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: ColorManager.grey.withValues(alpha: .2),
          width: 1.5,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:
            options
                .map(
                  (item) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          item.icon,
                          Text(
                            item.title == 'total students'
                                ? '${item.count}'
                                : "${item.count}%",
                            style: AppTextStyles.medium16.copyWith(
                              color: ColorManager.lightText,
                            ),
                          ),
                          Text(
                            item.title,
                            style: AppTextStyles.regular12.copyWith(
                              color: ColorManager.grey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
      ),
    );
  }
}
