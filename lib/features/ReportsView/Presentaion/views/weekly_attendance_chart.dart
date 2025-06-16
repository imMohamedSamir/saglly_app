import 'package:flutter/widgets.dart';
import 'package:hodory/core/theming/color_manager.dart';
import 'package:hodory/core/theming/text_styles.dart';
import 'package:hodory/features/ReportsView/Presentaion/views/chart_body.dart';

class WeeklyAttendanceChart extends StatelessWidget {
  const WeeklyAttendanceChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          'Weekly attendance',
          style: AppTextStyles.medium16.copyWith(color: ColorManager.lightText),
        ),
        const ChartBody(),
      ],
    );
  }
}
