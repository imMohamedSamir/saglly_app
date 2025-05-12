import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hodory/core/theming/color_manager.dart';
import 'package:hodory/core/theming/text_styles.dart';
import 'package:hodory/features/HistoryView/Presentaion/manager/cubit/history_cubit.dart';
import 'package:hodory/features/attendanceView/data/models/header_analysis_model.dart';
import 'package:shimmer/shimmer.dart';

class HistoryAnalysisSec extends StatelessWidget {
  const HistoryAnalysisSec({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryCubit, HistoryState>(
      builder: (context, state) {
        if (state is HistoryLoading) {
          return _buildShimmer();
        }

        final options =
            state is HistorySuccess
                ? [
                  HeaderAnalysisModel(
                    title: 'Students',
                    count: state.totalStudnets,
                    icon: const Icon(Icons.school),
                  ),
                  HeaderAnalysisModel(
                    title: 'Present',
                    count: state.totalPresent,
                    icon: const Icon(Icons.check_circle, color: Colors.green),
                  ),
                  HeaderAnalysisModel(
                    title: 'Absent',
                    count: state.totalAbsent,
                    icon: const Icon(Icons.close_rounded, color: Colors.red),
                  ),
                ]
                : [
                  HeaderAnalysisModel(
                    title: 'Students',
                    count: 0,
                    icon: const Icon(Icons.school),
                  ),
                  HeaderAnalysisModel(
                    title: 'Present',
                    count: 0,
                    icon: const Icon(Icons.check_circle, color: Colors.green),
                  ),
                  HeaderAnalysisModel(
                    title: 'Absent',
                    count: 0,
                    icon: const Icon(Icons.close_rounded, color: Colors.red),
                  ),
                ];

        return _buildStatsCard(options);
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
                            item.count.toString(),
                            style: AppTextStyles.medium16.copyWith(
                              color: ColorManager.lightText,
                            ),
                          ),
                          Text(
                            item.title,
                            style: AppTextStyles.regular12.copyWith(
                              color: ColorManager.grey,
                              fontSize: 12,
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

  Widget _buildShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          height: 110.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
