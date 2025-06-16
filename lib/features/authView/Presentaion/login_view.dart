import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hodory/core/utlis/service_locator.dart';
import 'package:hodory/features/authView/Presentaion/manager/auth_cubit/auth_cubit.dart';
import 'package:hodory/features/authView/data/repo/auth_repo_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'views/login/login_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => AuthCubit(
            getIt.get<AuthRepoImpl>(),
            getIt.get<SharedPreferences>(),
          ),
      child: const Scaffold(body: LoginBody()),
    );
  }
}
