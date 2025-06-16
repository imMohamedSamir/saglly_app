import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hodory/core/theming/color_manager.dart';
import 'package:hodory/core/theming/text_styles.dart';
import 'package:hodory/core/widgets/CustomTextField.dart';
import 'package:hodory/core/widgets/custom_drop_down.dart';
import 'package:hodory/features/HomeView/Presentaion/manager/class_cubit/class_cubit.dart';
import 'package:hodory/features/HomeView/data/models/class_model.dart';
import 'package:hodory/features/ReportsView/Presentaion/manager/cubit/report_cubit.dart';
import 'package:intl/intl.dart';

class ReportsFilterSec extends StatefulWidget {
  const ReportsFilterSec({super.key});

  @override
  State<ReportsFilterSec> createState() => _ReportsFilterSecState();
}

final TextEditingController dateController = TextEditingController();
DateTimeRange? selectedRange;
String classId = "";
Future<void> pickDateRange({required BuildContext context}) async {
  final DateTimeRange? picked = await showDateRangePicker(
    builder: (context, child) {
      return Theme(
        data: ThemeData.light().copyWith(
          primaryColor: ColorManager.primary,
          colorScheme: const ColorScheme.light(primary: ColorManager.primary),
          buttonTheme: const ButtonThemeData(
            textTheme: ButtonTextTheme.primary,
          ),
        ),
        child: child!,
      );
    },
    context: context,
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
    initialDateRange: selectedRange,
  );

  if (picked != null) {
    selectedRange = picked;

    final String formattedStart = DateFormat('yyyy/MM/dd').format(picked.start);
    final String formattedEnd = DateFormat('yyyy/MM/dd').format(picked.end);
    dateController.text = "$formattedStart - $formattedEnd";
    if (classId.isNotEmpty && selectedRange != null) {
      ReportCubit.get(
        context,
      ).getReport(classID: classId, date: selectedRange!);
    }
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
        BlocBuilder<ClassCubit, ClassState>(
          builder: (context, state) {
            final List<ClassModel> classes =
                state is ClassSuccess ? state.classes : [];
            return CustomDropDown(
              hint: "select class",
              items: classes,
              getLabel: (p0) => p0.name ?? "",
              getValue: (p0) => p0.id,
              onChanged: (p0) {
                classId = p0;
                if (classId.isNotEmpty && selectedRange != null) {
                  ReportCubit.get(
                    context,
                  ).getReport(classID: classId, date: selectedRange!);
                }
              },
            );
          },
        ),
        Text("Date range", style: AppTextStyles.medium16),
        CustomTextField(
          controller: dateController,
          hintText: "select date range",
          suffixIcon: const Icon(Icons.date_range_rounded),
          readOnly: true,
          onTap: () async {
            await pickDateRange(context: context);
          },
        ),
      ],
    );
  }
}
