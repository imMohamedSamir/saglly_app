import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../theming/color_manager.dart';
import '../theming/text_styles.dart';

class CustomRadioTile extends StatelessWidget {
  const CustomRadioTile({
    super.key,
    this.value,
    this.groupValue,
    this.onChanged,
    required this.title,
    this.icon,
  });
  final value;
  final groupValue;
  final void Function(dynamic)? onChanged;
  final String title;
  final Icon? icon;
  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(width: .4),
      ),
      // tileColor:
      //     groupValue == value
      //         ? ColorManager.secondary.withValues(alpha: .2)
      //         : null,
      activeColor: ColorManager.secondary,
      title: Row(
        children: [
          Text(title, style: AppTextStyles.medium18),
          const Spacer(),
          icon ?? const SizedBox.shrink(),
          const Gap(16),
        ],
      ),
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
    );
  }
}
