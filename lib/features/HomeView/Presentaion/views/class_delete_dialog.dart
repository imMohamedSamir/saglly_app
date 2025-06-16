import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hodory/core/theming/color_manager.dart';
import 'package:hodory/core/theming/text_styles.dart';
import 'package:hodory/core/widgets/customButton.dart';

class ClassDeleteDialog extends StatelessWidget {
  const ClassDeleteDialog({super.key, this.onPressed, required this.name});
  final void Function()? onPressed;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Delete Class", style: AppTextStyles.medium18),
          const Gap(16),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Are you sure you want to delete ",
                  style: AppTextStyles.medium16,
                ),
                TextSpan(
                  text: "$name ?",
                  style: AppTextStyles.medium16.copyWith(color: Colors.red),
                ),
              ],
            ),
          ),

          const Gap(16),
          Row(
            spacing: 8,
            children: [
              Expanded(
                child: CustomButton(
                  text: "delete",
                  txtcolor: Colors.white,
                  btncolor: Colors.red,
                  onPressed: onPressed,
                ),
              ),
              Expanded(
                child: CustomButton(
                  text: "cancel",
                  txtcolor: ColorManager.lightText,
                  btncolor: Colors.white,
                  withBorder: true,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
