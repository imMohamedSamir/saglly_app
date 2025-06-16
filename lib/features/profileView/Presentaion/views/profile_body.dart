import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'ProfileDetailsSec.dart';
import 'ProfileOptionsDetails.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [Gap(60), ProfileDetailsSec(), ProfileOptionsDetails()],
      ),
    );
  }
}
