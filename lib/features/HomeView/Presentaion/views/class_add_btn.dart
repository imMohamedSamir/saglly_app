import 'package:flutter/material.dart';
import 'package:hodory/core/theming/color_manager.dart';
import 'package:hodory/core/utlis/custom_btm_sheet.dart';

class ClassAddBtn extends StatelessWidget {
  const ClassAddBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: ColorManager.lightText,
      ),
      child: IconButton(
        onPressed: () {
          CustomBtmsheet.addClass();
        },
        icon: const Icon(Icons.add, color: Colors.white, size: 26),
      ),
    );
  }
}
