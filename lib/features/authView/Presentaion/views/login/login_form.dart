import 'package:flutter/material.dart';
import 'package:hodory/features/authView/Presentaion/manager/auth_cubit/auth_cubit.dart';

import '../../../../../core/theming/color_manager.dart';
import '../../../../../core/theming/text_styles.dart';
import '../../../../../core/utlis/validation.dart';
import '../../../../../core/widgets/CustomTextField.dart';
import '../../../../../core/widgets/custom_password_textField.dart';
import 'login_btn.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = AuthCubit.get(context);

    return Form(
      key: authCubit.formKey,
      child: Column(
        spacing: 16,
        children: [
          CustomTextField(
            label: "Email",
            hintText: "Enter your email",
            prefixIcon: const Icon(Icons.email_outlined),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            alwaysValidate: true,
            validator: Validation.email,
            onSaved: (p0) {
              authCubit.email = p0!.trim();
            },
          ),
          CustomPasswordTextfield(
            label: "Password",
            hintText: "Enter your password",
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            alwaysValidate: true,
            validator: Validation.password,
            onSaved: (p0) {
              authCubit.password = p0!.trim();
            },
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(16),
              child: Text(
                "forget password?",
                style: AppTextStyles.regular12.copyWith(
                  fontSize: 16,
                  color: ColorManager.grey,
                ),
              ),
            ),
          ),
          const LoginBtn(),
        ],
      ),
    );
  }
}
