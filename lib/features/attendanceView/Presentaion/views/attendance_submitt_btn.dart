import 'package:flutter/material.dart';
import 'package:hodory/core/theming/color_manager.dart';
import 'package:hodory/core/widgets/customButton.dart';

class AttendanceSubmittBtn extends StatelessWidget {
  const AttendanceSubmittBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
      child: CustomButton(
        text: "Submit Attendance",
        txtcolor: Colors.white,
        btncolor: ColorManager.primary,
        onPressed: () {},
      ),
    );
  }
}
