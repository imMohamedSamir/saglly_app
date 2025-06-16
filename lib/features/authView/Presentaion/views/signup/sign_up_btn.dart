import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theming/color_manager.dart';
import '../../../../../core/widgets/customButton.dart';
import '../../manager/auth_cubit/auth_cubit.dart';

class SignUpBtn extends StatelessWidget {
  const SignUpBtn({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = AuthCubit.get(context);

    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return CustomButton(
          text: "Sign up",
          txtcolor: Colors.white,
          btncolor: ColorManager.primary,
          isLoading: state is AuthLoading,
          onPressed: () {
            authCubit.signUp();
          },
        );
      },
    );
  }
}
