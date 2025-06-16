import 'package:flutter/material.dart';
import 'package:hodory/core/widgets/custom_appbar.dart';
import 'package:hodory/features/profileView/Presentaion/views/about_body.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar.normal(title: "About Us"),
      body: const AboutBody(),
    );
  }
}
