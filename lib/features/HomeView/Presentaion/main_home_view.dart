import 'package:flutter/material.dart';
import 'package:hodory/features/HistoryView/Presentaion/history_view.dart';
import 'package:hodory/features/HomeView/Presentaion/home_nav_bar.dart';
import 'package:hodory/features/HomeView/Presentaion/home_view.dart';
import 'package:hodory/features/ReportsView/Presentaion/reports_view.dart';

class MainHomeView extends StatelessWidget {
  const MainHomeView({super.key});
  static List<Widget> pages = [
    const HomeView(),
    const HistoryView(),
    const ReportsView(),
    const SizedBox(),
  ];
  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> currentIndex = ValueNotifier(2);
    return ValueListenableBuilder(
      valueListenable: currentIndex,
      builder: (BuildContext context, dynamic value, Widget? child) {
        return Scaffold(
          body: IndexedStack(index: currentIndex.value, children: pages),
          bottomNavigationBar: HomeNavBar(
            onTap: (p0) {
              currentIndex.value = p0;
            },
            selectedIndex: currentIndex.value,
          ),
        );
      },
    );
  }
}
