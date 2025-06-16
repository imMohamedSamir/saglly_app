import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hodory/features/profileView/Presentaion/manager/profile_cubit/profile_cubit.dart';

import '../../../../core/widgets/CustomTextField.dart';
import 'ProfileImgSec.dart';
import 'edit_profile_loading_widget.dart';

class EditProflieBody extends StatelessWidget {
  const EditProflieBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileSuccess) {
            final profile = state.profile;
            return SingleChildScrollView(
              child: Column(
                spacing: 16.h,
                children: [
                  const ProfileImgSec(name: "mohamed"),
                  const Gap(20),
                  CustomTextField(
                    initialValue: profile.name ?? "",
                    enabled: false,
                    label: "user name",
                    hintText: "user name",
                  ),
                  CustomTextField(
                    initialValue: profile.email ?? "",
                    enabled: false,
                    label: "Email",
                    hintText: "Email",
                  ),
                  CustomTextField(
                    initialValue: profile.phone ?? "",
                    enabled: false,
                    label: "Phone number",
                    hintText: "Phone number",
                  ),
                  CustomTextField(
                    initialValue: profile.gender ?? "",
                    enabled: false,
                    label: "Gender",
                    hintText: "Gender",
                  ),
                ],
              ),
            );
          } else if (state is ProfileLoading) {
            return const ProfileLoadingWdiget();
          } else {
            return const Center(child: Text('No Data'));
          }
        },
      ),
    );
  }
}
