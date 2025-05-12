import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hodory/core/theming/text_styles.dart';
import 'package:hodory/features/attendanceView/Presentaion/manager/attendance_cubit/attendance_cubit.dart';

class AttendanceCardOptions extends StatelessWidget {
  const AttendanceCardOptions({
    super.key,
    this.initialValue,
    required this.studetnId,
  });
  final String studetnId;
  final String? initialValue;
  static Map<String, Color> options = {'P': Colors.green, 'A': Colors.red};

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<String?> selectedOption = ValueNotifier<String?>(null);
    return ValueListenableBuilder<String?>(
      valueListenable: selectedOption,
      builder: (context, selected, _) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          children:
              options.entries.map((option) {
                final isSelected = selected == option.key;
                return InkWell(
                  onTap: () {
                    selectedOption.value = option.key;
                    AttendanceCubit.get(context).takeAttendance(
                      value: selectedOption.value ?? "",
                      studentId: studetnId,
                    );
                  },
                  borderRadius: BorderRadius.circular(50),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: isSelected ? 50.w : 48.w,
                    height: isSelected ? 50.h : 48.h,
                    decoration: BoxDecoration(
                      color:
                          isSelected
                              ? option.value
                              : option.value.withValues(alpha: .35),
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      option.key,
                      style: AppTextStyles.semiBold18.copyWith(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }).toList(),
        );
      },
    );
  }
}
