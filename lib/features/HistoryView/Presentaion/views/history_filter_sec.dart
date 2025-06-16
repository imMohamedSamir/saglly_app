import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hodory/core/theming/color_manager.dart';
import 'package:hodory/core/theming/text_styles.dart';
import 'package:hodory/core/utlis/Date_Formater.dart';
import 'package:hodory/core/widgets/CustomTextField.dart';
import 'package:hodory/core/widgets/custom_drop_down.dart';
import 'package:hodory/features/HistoryView/Presentaion/manager/cubit/history_cubit.dart';
import 'package:hodory/features/HomeView/Presentaion/manager/class_cubit/class_cubit.dart';
import 'package:hodory/features/HomeView/data/models/class_model.dart';

class HistoryFilterSec extends StatelessWidget {
  const HistoryFilterSec({super.key});

  @override
  Widget build(BuildContext context) {
    final cotroller = TextEditingController();
    DateTime initialDate = DateTime.now();
    String classId = "";
    String date = "";
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
              hint: "selecet class",
              items: classes,
              getLabel: (p0) => p0.name ?? "",
              getValue: (p0) => p0.id,
              onChanged: (p0) {
                classId = p0;
                if (date.isNotEmpty && classId.isNotEmpty) {
                  HistoryCubit.get(
                    context,
                  ).getHistory(date: date, classID: classId);
                }
              },
            );
          },
        ),
        Text("Date filter", style: AppTextStyles.medium16),

        CustomTextField(
          controller: cotroller,
          hintText: "selecet date",
          suffixIcon: const Icon(Icons.date_range_rounded),
          readOnly: true,
          maxLines: 1,
          onTap: () {
            _pickDate(
              context,
              initialDate: initialDate,
              onChanged: (value) {
                initialDate = DateTime.parse(value);
                date = value;
                cotroller.text = DateFormater.fromatDate(value: value);
                if (date.isNotEmpty && classId.isNotEmpty) {
                  HistoryCubit.get(
                    context,
                  ).getHistory(date: date, classID: classId);
                }
              },
            );
          },
        ),
      ],
    );
  }

  void _pickDate(
    BuildContext context, {
    required void Function(String)? onChanged,
    DateTime? initialDate,
  }) {
    showDatePicker(
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
      initialDate: initialDate,
      firstDate: DateTime(2015),
      lastDate: DateTime(2100),
    ).then((value) {
      if (value != null) {
        onChanged?.call(value.toIso8601String());
      } else {
        log("No date selected");
      }
    });
  }
}
