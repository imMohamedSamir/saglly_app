import 'package:flutter/material.dart';
import 'package:hodory/core/theming/color_manager.dart';
import 'package:hodory/core/theming/text_styles.dart';
import 'package:hodory/core/utlis/validation.dart';
import 'package:hodory/core/widgets/CustomTextField.dart';
import 'package:hodory/core/widgets/customButton.dart';

class ClassStudentBtmSheet extends StatelessWidget {
  const ClassStudentBtmSheet({super.key, required this.onSubmit, this.name});
  final void Function(String) onSubmit;
  final String? name;
  static final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: name ?? "");
    return Padding(
      padding: EdgeInsets.only(
        left: 16.0,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          spacing: 16,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Add new student', style: AppTextStyles.medium18),
            CustomTextField(
              controller: controller,
              hintText: 'Student Name',
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.done,
              validator: Validation.general,
            ),
            CustomButton(
              text: name != null ? "Edit" : "Add",
              txtcolor: Colors.white,
              btncolor: ColorManager.primary,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  onSubmit(controller.text);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
