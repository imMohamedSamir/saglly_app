import 'package:flutter/material.dart';
import 'package:hodory/core/widgets/custom_appbar.dart';
import 'package:hodory/features/HomeView/Presentaion/views/class_add_btn.dart';
import 'package:hodory/features/HomeView/Presentaion/views/home_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar.home(title: "My Classes"),
      body: const HomeBody(),
      floatingActionButton: const ClassAddBtn(),
    );
  }
}
