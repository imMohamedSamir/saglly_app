import 'package:flutter/material.dart';
import 'package:hodory/core/theming/color_manager.dart';
import 'package:hodory/core/theming/text_styles.dart';

class AboutTeamSec extends StatelessWidget {
  const AboutTeamSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        Text(
          "Our Team",
          style: AppTextStyles.semiBold16.copyWith(
            fontSize: 20,
            color: ColorManager.lightText,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 26,
          children: [
            _buildImg(
              img: "assets/images/Me.jpeg",
              name: 'Mohamed Samir',
              role: 'Team Leader\n Mobile Developer',
              onTap: () {},
            ),
            _buildImg(
              img: "assets/images/joo.png",
              name: 'Youssef Ahmed',
              role: 'Flutter Developer',
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildImg({
    required String img,
    required String name,
    required String role,
    void Function()? onTap,
  }) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(40),
          splashColor: ColorManager.primary.withValues(alpha: 0.2),
          highlightColor: ColorManager.primary.withValues(alpha: 0.1),

          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(img),
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
        Text(
          name,
          style: AppTextStyles.semiBold16.copyWith(
            fontSize: 16,
            color: ColorManager.lightText,
          ),
        ),
        Text(
          role,
          style: AppTextStyles.regular12.copyWith(
            fontSize: 14,
            color: ColorManager.grey,
          ),
        ),
      ],
    );
  }
}
