import 'package:flutter/material.dart';
import 'package:hodory/core/theming/text_styles.dart';
import 'package:hodory/core/widgets/CustomTextField.dart';
import 'package:hodory/core/widgets/custom_drop_down.dart';

class HistoryFilterSec extends StatelessWidget {
  const HistoryFilterSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text("Classes filter ", style: AppTextStyles.medium16),
        Row(
          spacing: 8,
          children: [
            Expanded(
              child: CustomDropDown(
                hint: "selecet class",
                items: const ['class 1', 'class2'],
                getLabel: (p0) => p0,
                getValue: (p0) => p0,
                onChanged: (p0) {},
              ),
            ),
            Expanded(
              child: CustomTextField(
                hintText: "selecet date",
                suffixIcon: const Icon(Icons.date_range_rounded),
                readOnly: true,
                onTap: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}
