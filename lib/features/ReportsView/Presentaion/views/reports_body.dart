import 'package:flutter/material.dart';
import 'package:hodory/features/ReportsView/Presentaion/views/report_analysis_sec.dart';
import 'package:hodory/features/ReportsView/Presentaion/views/reports_filter_sec.dart';

class ReportsBody extends StatelessWidget {
  const ReportsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(children: [ReportsFilterSec(), ReportAnalysisSec()]),
      ),
    );
  }
}
