import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utlis/validation.dart';
import '../../../../../core/widgets/CustomTextField.dart';
import '../../../../../core/widgets/custom_password_textField.dart';
import '../../manager/auth_cubit/auth_cubit.dart';
import 'sign_up_btn.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = AuthCubit.get(context);
    return Form(
      key: authCubit.formKey,
      child: Column(
        spacing: 16.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            label: "Full name",
            hintText: "enter full name",
            prefixIcon: const Icon(Icons.person_outline_rounded),
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            alwaysValidate: true,
            validator: Validation.name,
            onSaved: (p0) {
              authCubit.model.name = p0!.trim();
            },
          ),
          CustomTextField(
            label: "Email",
            hintText: "Enter your email",
            prefixIcon: const Icon(Icons.email_outlined),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            alwaysValidate: true,
            validator: Validation.email,
            onSaved: (p0) {
              authCubit.model.email = p0!.trim();
            },
          ),
          CustomTextField(
            label: "Phone",
            hintText: "Enter your phone number",
            prefixIcon: const Icon(Icons.phone_enabled_outlined),
            keyboardType: TextInputType.phone,
            alwaysValidate: true,
            textInputAction: TextInputAction.next,
            validator: Validation.phone,
            onSaved: (p0) {
              authCubit.model.phone = p0!.trim();
            },
          ),

          CustomPasswordTextfield(
            label: "Password",
            hintText: "Enter your password",
            keyboardType: TextInputType.visiblePassword,
            alwaysValidate: true,
            textInputAction: TextInputAction.next,
            validator: Validation.password,
            onChanged: (p0) {
              authCubit.model.password = p0.trim();
            },
            onSaved: (p0) {
              authCubit.model.password = p0!.trim();
            },
          ),
          const CustomPasswordTextfield(
            label: "Confirm password",
            hintText: "Enter confirm password",
            keyboardType: TextInputType.visiblePassword,
            alwaysValidate: true,
            textInputAction: TextInputAction.done,
          ),
          const Gap(8),
          const SignUpBtn(),
        ],
      ),
    );
  }
}
