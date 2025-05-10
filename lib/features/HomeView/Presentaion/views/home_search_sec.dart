import 'package:flutter/material.dart';
import 'package:hodory/core/theming/color_manager.dart';
import 'package:hodory/core/widgets/CustomTextField.dart';

class HomeSearchSec extends StatelessWidget {
  const HomeSearchSec({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomTextField(
      hintText: "Search classes...",
      prefixIcon: Icon(Icons.search, color: ColorManager.grey),
    );
  }
}
