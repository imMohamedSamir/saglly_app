import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/color_manager.dart';
import '../theming/text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    required this.text,
    required this.txtcolor,
    required this.btncolor,
    this.withBorder = false,
    this.isLoading = false,
  });
  final void Function()? onPressed;
  final String text;
  final Color txtcolor;
  final Color btncolor;
  final bool withBorder;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 58.h,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: withBorder ? null : WidgetStateProperty.all<double>(0),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
              side: BorderSide(
                color: withBorder ? ColorManager.primary : Colors.white,
              ),
            ),
          ),
          backgroundColor: WidgetStatePropertyAll<Color>(btncolor),
        ),
        onPressed: onPressed,
        child:
            isLoading
                ? SizedBox(
                  height: 20.h,
                  width: 20.w,
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2.5,
                  ),
                )
                : Text(
                  text,
                  style: AppTextStyles.medium16.copyWith(color: txtcolor),
                ),
      ),
    );
  }
}
