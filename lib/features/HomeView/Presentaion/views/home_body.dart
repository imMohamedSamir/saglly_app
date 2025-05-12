import 'package:flutter/material.dart';
import 'package:hodory/features/HomeView/Presentaion/manager/class_cubit/class_cubit.dart';
import 'package:hodory/features/HomeView/Presentaion/views/classes_list_sec.dart';
import 'package:hodory/features/HomeView/Presentaion/views/home_search_sec.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    ClassCubit.get(context).getClasses();
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(spacing: 16, children: [HomeSearchSec(), ClassesListSec()]),
    );
  }
}
