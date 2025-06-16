import 'package:flutter/material.dart';
import 'package:hodory/core/routing/NavigationMethod.dart';

import '../../../../core/theming/text_styles.dart';
import '../../data/models/profile_card_model.dart';

class ProfileOptionsCard extends StatelessWidget {
  const ProfileOptionsCard({super.key, required this.card});
  final ProfileOptionsCardModel card;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      onTap: () {
        NavigateToPage.slideFromLeft(context: context, page: card.page);
      },
      leading: Icon(card.icon, size: 30),
      title: Row(
        children: [
          Text(
            card.title,
            style: AppTextStyles.bold18.copyWith(
              color: const Color(0xff240301),
            ),
          ),
          const Spacer(),
          if ("اللغة" == card.title)
            Text("العربية", style: AppTextStyles.medium16),
          if ("Language" == card.title)
            Text("English", style: AppTextStyles.medium16),
        ],
      ),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
    );
  }
}
