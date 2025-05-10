import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/color_manager.dart';
import '../theming/text_styles.dart';

class CustomDropDown<T> extends StatelessWidget {
  const CustomDropDown({
    super.key,
    required this.hint,
    required this.items,
    required this.getLabel, // Function to get label from object
    required this.getValue,
    this.onChanged,
    this.initialSelection,
    this.isRequired = false,
    this.isSearch = false,
    this.enabled = true,
  });

  final String hint;
  final List<T> items; // Generic list of objects
  final String Function(T) getLabel; // Function to extract label
  final dynamic Function(T) getValue; // Function to extract value
  final void Function(dynamic)? onChanged; // Callback for value selection
  final dynamic initialSelection;
  final bool isRequired;
  final bool isSearch;
  final bool enabled;
  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      initialValue: initialSelection,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (isRequired && value == null) {
          return 'Please select your gender';
        }
        return null;
      },
      builder: (FormFieldState<dynamic> field) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownMenu(
                  trailingIcon: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 26,
                  ),
                  selectedTrailingIcon: const Icon(
                    Icons.keyboard_arrow_up_rounded,
                    size: 26,
                  ),
                  enabled: enabled,
                  initialSelection: initialSelection,
                  enableFilter: true,
                  focusNode: isSearch ? FocusNode() : null,
                  controller: TextEditingController(text: field.value),
                  textStyle: AppTextStyles.medium16.copyWith(
                    color: ColorManager.lightText,
                  ),
                  inputDecorationTheme: InputDecorationTheme(
                    hintStyle: AppTextStyles.medium16,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color:
                            field.hasError ? Colors.red : ColorManager.primary,
                      ),
                    ),
                  ),
                  menuStyle: MenuStyle(
                    shape: WidgetStateProperty.all<OutlinedBorder>(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                      ),
                    ),
                  ),
                  hintText: hint,
                  width: constraints.maxWidth,
                  menuHeight: 250.h,
                  onSelected: (value) {
                    field.didChange(value);
                    if (onChanged != null) onChanged!(value);
                  },
                  dropdownMenuEntries:
                      items
                          .map(
                            (item) => DropdownMenuEntry(
                              label: getLabel(item),
                              value: getValue(item),
                              labelWidget: Text(
                                getLabel(item),
                                style: AppTextStyles.medium16.copyWith(
                                  color: ColorManager.lightText,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                ),
                if (field.hasError) // Show validation error
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 16, right: 6),
                    child: Text(
                      field.errorText ?? '',
                      style: AppTextStyles.regular12.copyWith(
                        color: const Color(0xffB3271C),
                        fontSize: 12.5,
                      ),
                    ),
                  ),
              ],
            );
          },
        );
      },
    );
  }
}
