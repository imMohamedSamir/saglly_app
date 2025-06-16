import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hodory/core/theming/text_styles.dart';
import 'package:hodory/features/profileView/Presentaion/manager/profile_cubit/profile_cubit.dart';
import 'package:hodory/features/profileView/Presentaion/views/profile_details_loading.dart';

import '../../../../core/theming/color_manager.dart';

class ProfileDetailsSec extends StatelessWidget {
  const ProfileDetailsSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileSuccess) {
            final profile = state.profile;

            return Row(
              spacing: 18,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: ColorManager.primary.withValues(alpha: 0.3),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      profile.name!.characters.first,
                      style: AppTextStyles.semiBold18.copyWith(
                        fontSize: 60,
                        color: ColorManager.primary,
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8,
                  children: [
                    Text(
                      profile.name!,
                      style: AppTextStyles.bold18.copyWith(
                        fontSize: 20,
                        color: ColorManager.primary,
                      ),
                    ),
                    Text(
                      profile.email!,
                      style: AppTextStyles.medium16.copyWith(
                        color: ColorManager.grey,
                      ),
                    ),
                  ],
                ),
              ],
            );
          } else if (state is ProfileLoading) {
            return const ProfileDetailsLoading();
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
