import 'package:flutter/material.dart';
import 'package:hodory/core/theming/color_manager.dart';
import 'package:hodory/core/theming/text_styles.dart';
import 'package:hodory/core/widgets/CustomTextField.dart';
import 'package:hodory/core/widgets/customButton.dart';

class AddClassBtmSheet extends StatelessWidget {
  const AddClassBtmSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.0,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          Text("Add new class", style: AppTextStyles.medium18),
          const CustomTextField(hintText: 'Class Name'),
          const CustomTextField(hintText: 'Description'),
          CustomButton(
            text: "Add",
            txtcolor: Colors.white,
            btncolor: ColorManager.primary,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
