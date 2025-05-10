import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hodory/core/theming/color_manager.dart';
import 'package:hodory/core/theming/text_styles.dart';
import 'package:hodory/core/utlis/custom_btm_sheet.dart';

class ClassStudentCard extends StatelessWidget {
  const ClassStudentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              CustomBtmsheet.addStudent();
            },
            backgroundColor: const Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Edit',
          ),
          SlidableAction(
            onPressed: (context) {},
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
          onTap: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          contentPadding: EdgeInsets.zero,
          leading: ClipOval(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(color: ColorManager.primary),
              child: Text(
                _getName(name: "Alice Johnson"),
                style: AppTextStyles.medium18.copyWith(color: Colors.white),
              ),
            ),
          ),
          title: Text(
            'Alice Johnson',
            style: AppTextStyles.medium16.copyWith(
              color: ColorManager.lightText,
            ),
          ),
          subtitle: Row(
            spacing: 16,
            children: [
              Text(
                "Absent (5)",
                style: AppTextStyles.regular12.copyWith(fontSize: 14),
              ),
              Text(
                "Present (9)",
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

    String initials = words.map((word) => word[0]).join();
    return initials;
  }
}
