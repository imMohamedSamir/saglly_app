import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hodory/core/theming/color_manager.dart';
import 'package:hodory/core/theming/text_styles.dart';
import 'package:hodory/core/utlis/launchURL.dart';
import 'package:hodory/features/profileView/Presentaion/views/about_team_sec.dart';

class AboutBody extends StatelessWidget {
  const AboutBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: ColorManager.primary.withValues(alpha: 0.2),
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(
                  Icons.school,
                  size: 90,
                  color: ColorManager.primary,
                ),
              ),
            ),
            const Gap(16),
            Text(
              "Making attendance tracking smarter and easier",
              textAlign: TextAlign.center,
              style: AppTextStyles.bold18.copyWith(
                fontSize: 22,
                color: ColorManager.lightText,
              ),
            ),
            const Gap(8),
            Text(
              "Revolutionizing how schools manage attendance through smart technology and intuitive design.",
              textAlign: TextAlign.center,
              style: AppTextStyles.regular12.copyWith(
                fontSize: 16,
                color: ColorManager.grey,
              ),
            ),
            const Gap(16),

            _buildWhyHodory(),
            _ourMission(),
            const Gap(16),
            const AboutTeamSec(),
            const Gap(16),

            _contact(),
          ],
        ),
      ),
    );
  }

  Widget _buildWhyHodory() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Why Hodory?",
          style: AppTextStyles.semiBold18.copyWith(
            fontSize: 20,
            color: ColorManager.lightText,
          ),
        ),
        const Gap(8),
        _whyHodoryCard(
          title: "Streamlined Communication",
          subtitle: "Enhanced connection between teachers and administrators",
          icon: Icons.message_rounded,
        ),
        _whyHodoryCard(
          title: "Paperless Efficiency",
          subtitle: "Reduce manual paperwork and administrative burden",
          icon: Icons.file_copy_outlined,
        ),
        _whyHodoryCard(
          title: "Real-time Insights",
          subtitle: "Accurate attendance data and actionable analytics",
          icon: Icons.bar_chart_rounded,
        ),
      ],
    );
  }

  Widget _whyHodoryCard({
    required String title,
    required String subtitle,
    required IconData icon,
  }) {
    return ListTile(
      titleAlignment: ListTileTitleAlignment.top,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: ColorManager.primary.withValues(alpha: .2),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: ColorManager.primary, size: 24),
      ),
      title: Text(title, style: AppTextStyles.semiBold16),
      subtitle: Text(
        subtitle,
        style: AppTextStyles.regular12.copyWith(fontSize: 14),
      ),
    );
  }

  Widget _ourMission() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          "Our Mission",
          style: AppTextStyles.semiBold16.copyWith(
            fontSize: 20,
            color: ColorManager.lightText,
          ),
        ),
        Text(
          "Our goal is to eliminate the complexity of attendance management, allowing educators to focus on what matters most - teaching.",
          style: AppTextStyles.regular12.copyWith(fontSize: 16),
        ),
        Text(
          "By providing real-time insights and reducing administrative burden, we're helping schools create more efficient and engaging learning environments.",
          style: AppTextStyles.regular12.copyWith(fontSize: 16),
        ),
      ],
    );
  }

  Widget _contact() {
    return InkWell(
      onTap: () {
        launchURL('mailto:mousabsamir330@gamil.com');
      },
      borderRadius: BorderRadius.circular(16),

      child: Container(
        width: double.infinity,
        height: 60,
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: ColorManager.primary,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8,
          children: [
            const Icon(Icons.mail_outline_rounded, color: Colors.white),
            Text(
              "Get in Touch",
              style: AppTextStyles.semiBold16.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
