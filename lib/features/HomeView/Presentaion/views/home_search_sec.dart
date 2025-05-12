import 'package:flutter/material.dart';
import 'package:hodory/core/theming/color_manager.dart';
import 'package:hodory/core/widgets/CustomTextField.dart';
import 'package:hodory/features/HomeView/Presentaion/manager/class_cubit/class_cubit.dart';

class HomeSearchSec extends StatelessWidget {
  const HomeSearchSec({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hintText: "Search classes...",
      prefixIcon: const Icon(Icons.search, color: ColorManager.grey),
      onChanged: (value) {
        if (value.isEmpty) {
          ClassCubit.get(context).getClasses();
        } else {
          ClassCubit.get(context).getClasses(name: value);
        }
      },
    );
  }
}
