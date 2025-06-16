import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hodory/core/routing/NavigationMethod.dart';
import 'package:hodory/core/theming/color_manager.dart';
import 'package:hodory/core/theming/text_styles.dart';
import 'package:hodory/core/utlis/custom_dialog.dart';
import 'package:hodory/core/widgets/customButton.dart';
import 'package:hodory/features/ClassView/Presentaion/class_view.dart';
import 'package:hodory/features/HomeView/Presentaion/manager/class_cubit/class_cubit.dart';
import 'package:hodory/features/HomeView/data/models/class_model.dart';
import 'package:hodory/features/attendanceView/Presentaion/attendance_view.dart';

class ClassCard extends StatelessWidget {
  const ClassCard({super.key, required this.model});
  final ClassModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: ColorManager.grey.withValues(alpha: .2),
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                model.name ?? "",
                style: AppTextStyles.medium16.copyWith(
                  color: ColorManager.lightText,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  NavigateToPage.slideFromRight(
                    context: context,
                    page: ClassView(model: model),
                  );
                },
                icon: const Icon(Icons.edit),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "${model.studentNo} students",
                style: AppTextStyles.regular12.copyWith(fontSize: 16),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  CustomDialog.deleteClass(
                    name: model.name ?? "",
                    onPressed: () {
                      ClassCubit.get(context).deleteClass(id: model.id ?? "");
                    },
                  );
                },
                icon: const Icon(Icons.delete, color: Colors.red),
              ),
            ],
          ),
          const Gap(16),
          CustomButton(
            text: "Take Attendance",
            txtcolor: Colors.white,
            btncolor: ColorManager.primary,
            onPressed: () {
              NavigateToPage.slideFromBottom(
                context: context,
                page: AttendanceView(model: model),
              );
            },
          ),
        ],
      ),
    );
  }
}
