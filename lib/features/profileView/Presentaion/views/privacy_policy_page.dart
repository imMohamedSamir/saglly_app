import 'package:flutter/material.dart';
import 'package:hodory/core/widgets/custom_appbar.dart';

import 'privacy_policy_body.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar.normal(title: "Privacy policy"),
      body: const PrivacyPolicyBody(),
    );
  }
}
