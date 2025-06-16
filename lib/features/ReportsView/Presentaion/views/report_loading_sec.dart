import 'package:flutter/material.dart';
import 'package:hodory/features/ReportsView/Presentaion/views/loading_analysis_sec.dart';

class ReportLoadingSec extends StatelessWidget {
  const ReportLoadingSec({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      spacing: 8,
      children: [
        LoadingAnalysisSec(),
        LoadingAnalysisSec(height: 170),
        LoadingAnalysisSec(height: 130),
        LoadingAnalysisSec(height: 50),
      ],
    );
  }
}
