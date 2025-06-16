import 'package:flutter/material.dart';

import '../manager/language_cubit/language_cubit.dart';
import 'LanguageRadioLT.dart';

class LangaugeSec extends StatelessWidget {
  const LangaugeSec({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = LanguageCubit.get(context);
    return ValueListenableBuilder(
      valueListenable: cubit.groupValue,
      builder: (BuildContext context, String? value, Widget? child) {
        return Column(
          children: [
            LanguageRadioLT(
              title: "English (US)",
              groupValue: value,
              value: "en",
              onChanged: (p0) {
                cubit.groupValue.value = p0!;
                cubit.changeLanguage(const Locale('en'));
              },
            ),
            LanguageRadioLT(
              title: 'العربية',
              groupValue: value,
              value: "ar",
              onChanged: (p0) {
                cubit.groupValue.value = p0!;
                cubit.changeLanguage(const Locale('ar'));
              },
            ),
          ],
        );
      },
    );
  }
}
