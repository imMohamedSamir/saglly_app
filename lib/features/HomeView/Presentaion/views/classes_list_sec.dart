import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hodory/core/theming/color_manager.dart';
import 'package:hodory/features/HomeView/Presentaion/manager/class_cubit/class_cubit.dart';
import 'package:hodory/features/HomeView/Presentaion/views/class_card.dart';
import 'package:hodory/features/HomeView/Presentaion/views/class_loading_sec.dart';
import 'package:hodory/features/HomeView/Presentaion/views/classes_empty.dart';

class ClassesListSec extends StatelessWidget {
  const ClassesListSec({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClassCubit, ClassState>(
      builder: (context, state) {
        if (state is ClassLoading) {
          return const ClassLoadingSec();
        } else if (state is ClassSuccess) {
          if (state.classes.isEmpty) {
            return const ClassesEmpty();
          }
          final classes = state.classes;
          return Expanded(
            child: RefreshIndicator(
              color: ColorManager.primary,
              onRefresh: () async {
                ClassCubit.get(context).getClasses();
              },
              child: ListView.builder(
                itemCount: classes.length,
                itemBuilder: (BuildContext context, int index) {
                  return ClassCard(model: classes[index]);
                },
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
