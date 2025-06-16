import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hodory/core/utlis/service_locator.dart';
import 'package:hodory/features/profileView/Presentaion/manager/profile_cubit/profile_cubit.dart';
import 'package:hodory/features/profileView/data/repo/profile_repo_impl.dart';

import 'views/profile_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => ProfileCubit(getIt.get<ProfileRepoImpl>())..getDetails(),
      child: const Scaffold(body: ProfileBody()),
    );
  }
}
