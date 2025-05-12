import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hodory/core/theming/color_manager.dart';
import 'package:hodory/core/theming/text_styles.dart';
import 'package:hodory/core/utlis/custom_btm_sheet.dart';
import 'package:hodory/core/utlis/custom_dialog.dart';
import 'package:hodory/features/ClassView/Presentaion/manager/students_cubit/students_cubit.dart';
import 'package:hodory/features/HomeView/data/models/student_model.dart';

class ClassStudentCard extends StatelessWidget {
  const ClassStudentCard({super.key, required this.model});
  final StudentModel model;
  @override
  Widget build(BuildContext context) {
    final BuildContext safeContext = context;
    return Slidable(
      key: ValueKey(model),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        dragDismissible: false,

        children: [
          SlidableAction(
            onPressed: (context) {
              CustomBtmsheet.addStudent(
                name: model.name,
                onSubmit: (name) {
                  StudentsCubit.get(
                    safeContext,
                  ).updateStudent(name: name, model: model);
                },
              );
            },
            backgroundColor: const Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Edit',
          ),
          SlidableAction(
            onPressed: (context) {
              CustomDialog.deleteStudetn(
                name: model.name ?? "",
                onPressed: () {
                  StudentsCubit.get(safeContext).deleteStudent(model: model);
                },
              );
            },
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),

      child: Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          contentPadding: EdgeInsets.zero,
          leading: Container(
            height: 40.h,
            width: 40.h,
            decoration: const BoxDecoration(
              color: ColorManager.primary,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                _getName(name: model.name ?? ""),
                style: AppTextStyles.medium18.copyWith(color: Colors.white),
              ),
            ),
          ),
          title: Text(
            model.name ?? "",
            style: AppTextStyles.medium16.copyWith(
              color: ColorManager.lightText,
            ),
          ),
          subtitle: Row(
            spacing: 16,
            children: [
              Text(
                "Absent (${model.absentNo})",
                style: AppTextStyles.regular12.copyWith(fontSize: 14),
              ),
              Text(
                "Present (${model.presentNo})",
                style: AppTextStyles.regular12.copyWith(fontSize: 14),
              ),
            ],
          ),
          // trailing: const Icon(Icons.arrow_forward_ios_rounded),
        ),
      ),
    );
  }

  String _getName({required String name}) {
    List<String> words = name.trim().split(' ');

    String initials = words.map((word) => word[0].toUpperCase()).join();
    return initials;
  }
}
