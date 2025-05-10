import 'package:flutter/material.dart';
import 'package:hodory/core/theming/color_manager.dart';
import 'package:hodory/core/utlis/custom_btm_sheet.dart';
import 'package:hodory/core/widgets/customButton.dart';

class ClassAddStudentBtn extends StatelessWidget {
  const ClassAddStudentBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
      child: CustomButton(
        text: "Add student",
        txtcolor: Colors.white,
        btncolor: ColorManager.primary,
        onPressed: () {
          CustomBtmsheet.addStudent();
        },
      ),
    );
  }
}
