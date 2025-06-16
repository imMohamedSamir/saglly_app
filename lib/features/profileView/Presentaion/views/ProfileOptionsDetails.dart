import 'package:flutter/material.dart';
import 'package:hodory/features/profileView/Presentaion/views/LanguagePage.dart';
import 'package:hodory/features/profileView/Presentaion/views/Logout_widget.dart';
import 'package:hodory/features/profileView/Presentaion/views/edit_profile_page.dart';

import '../../data/models/profile_card_model.dart';
import 'ProfileOptionsCard.dart';
import 'about_view.dart';
import 'help_Center_page.dart';
import 'privacy_policy_page.dart';

class ProfileOptionsDetails extends StatelessWidget {
  const ProfileOptionsDetails({super.key});
  static List<ProfileOptionsCardModel> options = [
    ProfileOptionsCardModel(
      title: "Edit profile",
      icon: Icons.person_pin,
      page: const EditProfilePage(),
    ),
    ProfileOptionsCardModel(
      title: "Language",
      icon: Icons.language,
      page: const LanguagePage(),
    ),
    ProfileOptionsCardModel(
      title: "Privacy policy",
      icon: Icons.privacy_tip_outlined,
      page: const PrivacyPolicyPage(),
    ),
    ProfileOptionsCardModel(
      title: "Help center",
      icon: Icons.help_center,
      page: const HelpCenterPage(),
    ),

    ProfileOptionsCardModel(
      title: "About us",
      icon: Icons.fmd_bad_rounded,
      page: const AboutView(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(
          options.length,
          (index) => ProfileOptionsCard(card: options[index]),
        ),
        const LogoutWidget(),
      ],
    );
  }
}
