import 'package:flutter/material.dart';
import 'package:hodory/core/theming/text_styles.dart';
import 'package:hodory/core/utlis/custom_dialog.dart';
import 'package:hodory/features/profileView/Presentaion/manager/profile_cubit/profile_cubit.dart';

class LogoutWidget extends StatelessWidget {
  const LogoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      onTap: () {
        CustomDialog.logoutMsg(
          onPressed: () {
            ProfileCubit.get(context).logout();
          },
        );
      },
      leading: const Icon(Icons.logout_rounded, size: 30, color: Colors.red),
      title: Text(
        "Logout",
        style: AppTextStyles.bold18.copyWith(color: Colors.red),
      ),
      trailing: const Icon(Icons.arrow_forward_ios_rounded, color: Colors.red),
    );
  }
}
