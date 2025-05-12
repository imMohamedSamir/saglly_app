import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hodory/core/theming/color_manager.dart';
import 'package:hodory/core/theming/text_styles.dart';
import 'package:hodory/core/utlis/validation.dart';
import 'package:hodory/core/widgets/CustomTextField.dart';
import 'package:hodory/core/widgets/customButton.dart';
import 'package:hodory/features/HomeView/Presentaion/manager/class_cubit/class_cubit.dart';

class AddClassBtmSheet extends StatelessWidget {
  const AddClassBtmSheet({super.key, required this.onExit});
  final Function() onExit;
  @override
  Widget build(BuildContext context) {
    final cubit = ClassCubit.get(context);
    return Padding(
      padding: EdgeInsets.only(
        left: 16.0,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Form(
        key: cubit.formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            Text("Add new class", style: AppTextStyles.medium18),
            CustomTextField(
              hintText: 'Class Name',
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              validator: Validation.general,
              onSaved: (p0) {
                cubit.model.name = p0!.trim();
              },
            ),
            CustomTextField(
              hintText: 'Description',
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.done,
              validator: Validation.general,

              onSaved: (p0) {
                cubit.model.desc = p0!.trim();
              },
            ),
            BlocBuilder<ClassCubit, ClassState>(
              builder: (context, state) {
                if (state is ClassSuccess) {
                  onExit();
                }
                return CustomButton(
                  text: "Add",
                  txtcolor: Colors.white,
                  btncolor: ColorManager.primary,
                  isLoading: state is ClassLoading,
                  onPressed: () {
                    cubit.addClass();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
