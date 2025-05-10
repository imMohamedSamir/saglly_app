import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hodory/core/theming/text_styles.dart';
import 'package:hodory/core/widgets/CustomTextField.dart';
import 'package:hodory/core/widgets/custom_drop_down.dart';

class ReportsFilterSec extends StatelessWidget {
  const ReportsFilterSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text("Classes filter ", style: AppTextStyles.medium16),
        CustomDropDown(
          hint: "selecet class",
          items: const ['class 1', 'class2'],
          getLabel: (p0) => p0,
          getValue: (p0) => p0,
          onChanged: (p0) {
            log(p0.toString());
          },
        ),
        CustomTextField(
          hintText: "selecet date range",
          suffixIcon: const Icon(Icons.date_range_rounded),
          readOnly: true,
          onTap: () {},
        ),
      ],
    );
  }
}
