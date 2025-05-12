import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hodory/core/utlis/service_locator.dart';
import 'package:hodory/core/widgets/custom_appbar.dart';
import 'package:hodory/features/HomeView/Presentaion/manager/class_cubit/class_cubit.dart';
import 'package:hodory/features/HomeView/Presentaion/views/class_add_btn.dart';
import 'package:hodory/features/HomeView/Presentaion/views/home_body.dart';
import 'package:hodory/features/HomeView/data/repo/classes_repo_impl.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ClassCubit(getIt.get<ClassesRepoImpl>()),
      child: Scaffold(
        appBar: CustomAppbar.home(title: "My Classes"),
        body: const HomeBody(),
        floatingActionButton: const ClassAddBtn(),
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}
