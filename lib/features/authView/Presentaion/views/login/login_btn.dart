import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hodory/features/authView/Presentaion/manager/auth_cubit/auth_cubit.dart';

import '../../../../../core/theming/color_manager.dart';
import '../../../../../core/widgets/customButton.dart';

class LoginBtn extends StatelessWidget {
  const LoginBtn({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = AuthCubit.get(context);

    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return CustomButton(
          text: "Login",
          txtcolor: Colors.white,
          btncolor: ColorManager.primary,
          isLoading: state is AuthLoading,
          onPressed: () {
            authCubit.login();
          },
        );
      },
    );
  }
}
