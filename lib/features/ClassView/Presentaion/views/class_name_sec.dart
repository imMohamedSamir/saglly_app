import 'package:flutter/material.dart';
import 'package:hodory/core/theming/text_styles.dart';
import 'package:hodory/core/widgets/CustomTextField.dart';
import 'package:hodory/features/ClassView/Presentaion/manager/students_cubit/students_cubit.dart';
import 'package:hodory/features/HomeView/data/models/class_model.dart';

class ClassNameSec extends StatelessWidget {
  const ClassNameSec({super.key, required this.model});
  final ClassModel model;
  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: model.name);
    final ValueNotifier<bool> isEdit = ValueNotifier<bool>(false);
    return ValueListenableBuilder(
      valueListenable: isEdit,
      builder: (context, value, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            Text('Class Name', style: AppTextStyles.medium16),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: controller,
                    enabled: value,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    isEdit.value = !isEdit.value;
                    if (value) {
                      StudentsCubit.get(
                        context,
                      ).editClass(model: model.copyWith(name: controller.text));
                    }
                  },
                  icon: Icon(value ? Icons.save : Icons.edit),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
