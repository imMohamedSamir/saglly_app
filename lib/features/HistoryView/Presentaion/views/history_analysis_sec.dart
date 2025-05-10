import 'package:flutter/material.dart';
import 'package:hodory/core/theming/color_manager.dart';
import 'package:hodory/core/theming/text_styles.dart';
import 'package:hodory/features/attendanceView/data/models/header_analysis_model.dart';

class HistoryAnalysisSec extends StatelessWidget {
  const HistoryAnalysisSec({super.key});
  static Map<String, int> titles = {
    'students': 28,
    'present': 18,
    'absent': 10,
  };
  static final List<HeaderAnalysisModel> _options = [
    HeaderAnalysisModel(
      title: 'Students',
      count: 28,
      icon: const Icon(Icons.school),
    ),
    HeaderAnalysisModel(
      title: 'Present',
      count: 18,
      icon: const Icon(Icons.check_circle, color: Colors.green),
    ),
    HeaderAnalysisModel(
      title: 'Absent',
      count: 10,
      icon: const Icon(Icons.close_rounded, color: Colors.red),
    ),
  ];
  @override
  Widget build(BuildContext context) {
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
        spacing: 6,
        children:
            _options.map((title) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      title.icon,
                      Text(
                        title.count.toString(),

                        style: AppTextStyles.medium16.copyWith(
                          color: ColorManager.lightText,
                        ),
                      ),
                      Text(
                        title.title.toString(),

                        style: AppTextStyles.regular12.copyWith(
                          color: ColorManager.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }
}
