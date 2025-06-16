import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/routing/NavigationMethod.dart';
import '../../../../../core/theming/color_manager.dart';
import '../../../../../core/theming/text_styles.dart';
import '../../login_view.dart';
import 'sign_up_form.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Gap(80.h),
            Text(
              "create account",
              style: AppTextStyles.bold18.copyWith(
                fontSize: 28,
                color: ColorManager.lightText,
              ),
            ),
            Text(
              "Join to our community",
              style: AppTextStyles.regular12.copyWith(
                fontSize: 16,
                color: ColorManager.grey,
              ),
            ),
            Gap(30.h),
            const SignUpForm(),
            Gap(12.h),

            Center(
              child: InkWell(
                onTap: () {
                  NavigateToPage.slideFromRight(
                    context: context,
                    page: const LoginView(),
                  );
                },
                borderRadius: BorderRadius.circular(16),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Already have account?",
                        style: AppTextStyles.regular12.copyWith(
                          fontSize: 16,
                          color: ColorManager.grey,
                        ),
                      ),
                      TextSpan(
                        text: " Login",
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
      ),
    );
  }
}
