import 'package:flutter/material.dart';
import 'package:hodory/core/theming/text_styles.dart';
import 'package:hodory/core/widgets/CustomTextField.dart';

class ClassNameSec extends StatelessWidget {
  const ClassNameSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text('Class Name', style: AppTextStyles.medium16),
        const CustomTextField(initialValue: "math", enabled: false),
      ],
    );
  }
}
