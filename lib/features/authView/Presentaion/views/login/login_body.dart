import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hodory/core/routing/NavigationMethod.dart';
import 'package:hodory/core/theming/color_manager.dart';
import 'package:hodory/core/theming/text_styles.dart';

import '../../sign_up_view.dart';
import 'login_form.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Gap(120.h),
          Text(
            "Login",
            style: AppTextStyles.bold18.copyWith(
              fontSize: 28,
              color: ColorManager.lightText,
            ),
          ),
          Text(
            "Welcome back",
            style: AppTextStyles.regular12.copyWith(
              fontSize: 16,
              color: ColorManager.grey,
            ),
          ),
          Gap(20.h),

          const LoginForm(),
          Gap(12.h),
          Center(
            child: InkWell(
              onTap: () {
                NavigateToPage.slideFromLeft(
                  context: context,
                  page: const SignUpView(),
                );
              },
              borderRadius: BorderRadius.circular(16),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Don't have account ?",
                      style: AppTextStyles.regular12.copyWith(
                        fontSize: 16,
                        color: ColorManager.grey,
                      ),
                    ),
                    TextSpan(
                      text: "SignUp ",
                      style: AppTextStyles.bold18.copyWith(
                        fontSize: 16,
                        color: ColorManager.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
