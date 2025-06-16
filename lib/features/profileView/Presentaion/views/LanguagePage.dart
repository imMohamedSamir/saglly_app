import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_appbar.dart';
import 'LangaugeSec.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar.normal(title: "اللغة"),
      body: const LangaugeSec(),
    );
  }
}
