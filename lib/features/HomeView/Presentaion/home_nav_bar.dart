import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hodory/core/theming/color_manager.dart';
import 'package:hodory/core/theming/text_styles.dart';

class HomeNavBar extends StatelessWidget {
  const HomeNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });
  final int selectedIndex;
  final Function(int) onTap;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 10,
      backgroundColor: Colors.white,
      selectedLabelStyle: AppTextStyles.semiBold16.copyWith(fontSize: 14.sp),
      unselectedLabelStyle: AppTextStyles.medium16.copyWith(fontSize: 13.sp),
      selectedItemColor: ColorManager.primary,
      unselectedItemColor: ColorManager.grey,
      showUnselectedLabels: true,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.class_), label: "Classes"),
        BottomNavigationBarItem(
          icon: Icon(Icons.history_rounded),
          label: "History",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bar_chart_rounded),
          label: "Reports",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "profile"),
      ],
      currentIndex: selectedIndex,
      onTap: onTap,
    );
  }
}
