import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/theming/color_manager.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgets/customButton.dart';

class LogoutMsg extends StatelessWidget {
  const LogoutMsg({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
      child: Column(
        spacing: 16.h,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Logout",
            style: AppTextStyles.semiBold18.copyWith(
              color: ColorManager.lightText,
            ),
          ),
          Text("Are you sure want logout ?", style: AppTextStyles.medium16),
          const Gap(8),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  text: "logout",
                  txtcolor: Colors.white,
                  btncolor: Colors.redAccent,
                  onPressed: onPressed,
                ),
              ),
              const Gap(8),

              Expanded(
                child: CustomButton(
                  text: "cancel",
                  txtcolor: Colors.blueGrey,
                  btncolor: Colors.white,
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
