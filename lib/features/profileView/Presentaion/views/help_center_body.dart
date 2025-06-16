import 'package:flutter/material.dart';

import '../../../../core/theming/color_manager.dart';
import '../../../../core/utlis/launchURL.dart';
import 'HelpCenterCard.dart';

class HelpCenterBody extends StatelessWidget {
  const HelpCenterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
      child: Column(
        textDirection: TextDirection.ltr,
        children: [
          HelpCenterCard(
            onTap: () {
              launchURL("tel:+20 01127523369");
            },
            title: "01127523369",
            child: const Icon(Icons.call, color: ColorManager.primary),
          ),
          const SizedBox(height: 24),
          HelpCenterCard(
            onTap: () {
              launchURL('mailto:mousabsamir330@gamil.com');
            },
            title: "mousabsamir330@gamil.com",
            child: const Icon(Icons.email, color: ColorManager.primary),
          ),
          const SizedBox(height: 24),
          HelpCenterCard(
            onTap: () {
              launchURL("https://www.facebook.com/mohamed.samirmohamed.731");
            },
            title: "Facebook",
            child: const Icon(Icons.facebook, color: ColorManager.primary),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
