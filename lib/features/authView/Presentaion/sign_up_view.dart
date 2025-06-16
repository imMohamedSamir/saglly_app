import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hodory/features/authView/data/repo/auth_repo_impl.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/utlis/service_locator.dart';
import 'manager/auth_cubit/auth_cubit.dart';
import 'views/signup/sign_up_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => AuthCubit(
            getIt.get<AuthRepoImpl>(),
            getIt.get<SharedPreferences>(),
          ),
      child: const Scaffold(body: SignUpBody()),
    );
  }
}
