import 'package:flutter/material.dart';
import 'package:hodory/core/theming/color_manager.dart';
import 'package:hodory/core/theming/text_styles.dart';
import 'package:hodory/core/widgets/CustomTextField.dart';
import 'package:hodory/core/widgets/customButton.dart';

class ClassStudentBtmSheet extends StatelessWidget {
  const ClassStudentBtmSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.0,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Column(
        spacing: 16,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Add new student', style: AppTextStyles.medium18),
          const CustomTextField(hintText: 'Student Name'),
          CustomButton(
            text: "Add",
            txtcolor: Colors.white,
            btncolor: ColorManager.primary,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
