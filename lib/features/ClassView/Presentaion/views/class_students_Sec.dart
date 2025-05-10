import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hodory/core/theming/color_manager.dart';
import 'package:hodory/core/theming/text_styles.dart';
import 'package:hodory/features/ClassView/Presentaion/views/class_students_list.dart';

class ClassStudentsSec extends StatelessWidget {
  const ClassStudentsSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Students (10)",
            style: AppTextStyles.regular12.copyWith(
              fontSize: 16,
              color: ColorManager.lightText,
            ),
          ),
          Text(
            "Drag to left to edit student details",
            style: AppTextStyles.regular12.copyWith(fontSize: 14),
          ),
          const Gap(8),
          const ClassStudentsList(),
        ],
      ),
    );
  }
}
