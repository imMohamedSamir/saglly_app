import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hodory/core/utlis/service_locator.dart';
import 'package:hodory/core/widgets/custom_appbar.dart';
import 'package:hodory/features/profileView/Presentaion/manager/profile_cubit/profile_cubit.dart';
import 'package:hodory/features/profileView/data/repo/profile_repo_impl.dart';

import 'edit_proflie_body.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => ProfileCubit(getIt.get<ProfileRepoImpl>())..getDetails(),
      child: Scaffold(
        appBar: CustomAppbar.normal(title: "Edit profile"),
        body: const EditProflieBody(),
      ),
    );
  }
}
