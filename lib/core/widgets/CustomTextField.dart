import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/color_manager.dart';
import '../theming/text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    this.onSaved,
    this.suffixIcon,
    this.secure,
    this.onChanged,
    this.initialValue,
    this.readOnly,
    this.prefixIcon,
    this.onTap,
    this.maxLines,
    this.suffixIconConstraints,
    this.controller,
    this.autovalidateMode,
    this.focusNode,
    this.label,
    this.enabled = true,
    this.isEGP = false,
    this.filled = false,
    this.onFieldSubmitted,
    this.alwaysValidate = false,
  });
  final String? hintText;
  final TextInputType? keyboardType;
  final int? maxLines;
  final String? label;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final Widget? suffixIcon;
  final bool? secure;
  final String? initialValue;
  final BoxConstraints? suffixIconConstraints;
  final bool? readOnly;
  final Widget? prefixIcon;
  final void Function()? onTap;
  final TextEditingController? controller;
  final AutovalidateMode? autovalidateMode;
  final FocusNode? focusNode;
  final bool? enabled;
  final bool isEGP;
  final bool filled;
  final void Function(String)? onFieldSubmitted;
  final bool alwaysValidate;
  @override
  Widget build(BuildContext context) {
    final isArabic = false;
    return TextFormField(
      textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
      cursorOpacityAnimates: true,
      maxLines: secure == true ? 1 : maxLines,
      focusNode: focusNode,
      autovalidateMode:
          alwaysValidate
              ? AutovalidateMode.onUserInteraction
              : autovalidateMode,
      controller: controller,
      onTap: onTap,
      readOnly: readOnly ?? false,
      style: AppTextStyles.medium16.copyWith(color: const Color(0xff240301)),
      initialValue: initialValue,
      obscureText: secure ?? false,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: validator,
      keyboardType: isEGP ? TextInputType.number : keyboardType,
      textInputAction: textInputAction,
      enabled: enabled,
      decoration: InputDecoration(
        filled: filled,
        fillColor: Colors.white,
        suffixIconConstraints: suffixIconConstraints,
        suffixIcon:
            isEGP
                ? Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text("ج.م", style: AppTextStyles.medium18),
                )
                : suffixIcon,
        prefixIcon: prefixIcon,
        label: label != null ? Text(label!) : null,
        labelStyle: AppTextStyles.medium16.copyWith(
          color: ColorManager.lightText,
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: ColorManager.grey, width: 2.5),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 133, 133, 133),
          ),
        ),
        hintText: hintText,
        hintStyle: AppTextStyles.medium16.copyWith(
          color: const Color(0xff9E9D9D),
        ),
        contentPadding: EdgeInsets.only(
          left: isArabic ? 0 : 20.w,
          top: 16.h,
          bottom: 16.h,
          right: isArabic ? 20 : 0,
        ),
      ),
    );
  }
}
