import 'package:flutter/material.dart';
import 'package:hodory/core/widgets/custom_appbar.dart';
import 'package:hodory/features/HistoryView/Presentaion/views/history_body.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar.home(title: "Attendance History"),
      body: const HistoryBody(),
    );
  }
}
