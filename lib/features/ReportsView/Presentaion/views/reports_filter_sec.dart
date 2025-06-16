import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hodory/core/theming/text_styles.dart';
import 'package:hodory/core/widgets/CustomTextField.dart';
import 'package:hodory/core/widgets/customButton.dart';
import 'package:hodory/core/widgets/custom_drop_down.dart';
import 'package:intl/intl.dart';

class ReportsFilterSec extends StatefulWidget {
  const ReportsFilterSec({super.key});

  @override
  State<ReportsFilterSec> createState() => _ReportsFilterSecState();
}
final TextEditingController dateController = TextEditingController();
DateTimeRange? selectedRange;

Future<void> pickDateRange({required BuildContext context}) async {
  final DateTimeRange? picked = await showDateRangePicker(
    context: context,
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
    initialDateRange: selectedRange,
  );

  if (picked != null) {
      selectedRange = picked;
      // Format date as yyyy/MM/dd
      final String formattedStart = DateFormat('yyyy/MMM/dd').format(picked.start);
      final String formattedEnd = DateFormat('yyyy/MMM/dd').format(picked.end);
      dateController.text = "$formattedStart - $formattedEnd";
  }
}
class _ReportsFilterSecState extends State<ReportsFilterSec> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text("Classes filter ", style: AppTextStyles.medium16),
        CustomDropDown(
          hint: "select class",
          items: const ['class 1', 'class2'],
          getLabel: (p0) => p0,
          getValue: (p0) => p0,
          onChanged: (p0) {
            log(p0.toString());
          },
        ),
        Text("Date range", style: AppTextStyles.medium16),
        CustomTextField(
          controller: dateController,
          hintText: "select date range",
          suffixIcon: const Icon(Icons.date_range_rounded),
          readOnly: true,
          onTap: () async{
           await pickDateRange(context: context);
          },
          onFieldSubmitted: (value){
            log(value);
           
          },
        ),
        CustomButton(text: 'Apply Filters', txtcolor: Colors.white, btncolor: Colors.blue)
      ],
    );
  }
}
