import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_appbar.dart';
import 'help_center_body.dart';

class HelpCenterPage extends StatelessWidget {
  const HelpCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar.normal(title: "Help Center"),
      body: const HelpCenterBody(),
    );
  }
}
