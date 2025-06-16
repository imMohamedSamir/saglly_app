import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/color_manager.dart';
import '../theming/text_styles.dart';

class CustomPasswordTextfield extends StatelessWidget {
  const CustomPasswordTextfield({
    super.key,
    this.hintText,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    this.onSaved,
    this.onChanged,
    this.controller,
    this.autovalidateMode,
    this.focusNode,
    this.label,
    this.onFieldSubmitted,
    this.alwaysValidate = false,
  });
  final String? hintText;
  final TextInputType? keyboardType;
  final String? label;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;

  final TextEditingController? controller;
  final AutovalidateMode? autovalidateMode;
  final FocusNode? focusNode;

  final void Function(String)? onFieldSubmitted;
  final bool alwaysValidate;
  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isObscure = ValueNotifier(true);
    return ValueListenableBuilder(
      valueListenable: isObscure,
      builder: (BuildContext context, bool value, Widget? child) {
        return TextFormField(
          cursorOpacityAnimates: true,
          maxLines: 1,
          focusNode: focusNode,
          autovalidateMode:
              alwaysValidate
                  ? AutovalidateMode.onUserInteraction
                  : autovalidateMode,
          controller: controller,
          style: AppTextStyles.medium18.copyWith(
            color: const Color(0xff240301),
          ),
          obscureText: value,
          onFieldSubmitted: onFieldSubmitted,
          onChanged: onChanged,
          onSaved: onSaved,
          validator: validator,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          decoration: InputDecoration(
            fillColor: Colors.white,
            prefixIcon: const Icon(Icons.lock_outline_rounded),
            suffixIcon: IconButton(
              icon:
                  isObscure.value
                      ? const Icon(Icons.visibility_off_outlined)
                      : const Icon(Icons.visibility_outlined),
              onPressed: () {
                isObscure.value = !isObscure.value;
              },
            ),
            label: label != null ? Text(label!) : null,
            labelStyle: AppTextStyles.medium16.copyWith(
              color: ColorManager.lightText,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(
                color: ColorManager.grey,
                width: 2.5,
              ),
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
              left: 20.w,
              top: 16.h,
              bottom: 16.h,
              right: 0,
            ),
          ),
        );
      },
    );
  }
}
