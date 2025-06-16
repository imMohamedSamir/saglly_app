import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hodory/features/ReportsView/Presentaion/manager/cubit/report_cubit.dart';
import 'package:hodory/features/ReportsView/Presentaion/views/report_analysis.dart';
import 'package:hodory/features/ReportsView/Presentaion/views/report_attendance_table.dart';
import 'package:hodory/features/ReportsView/Presentaion/views/report_empty_sec.dart';
import 'package:hodory/features/ReportsView/Presentaion/views/report_export_sec.dart';
import 'package:hodory/features/ReportsView/Presentaion/views/report_loading_sec.dart';
import 'package:hodory/features/ReportsView/Presentaion/views/reports_filter_sec.dart';
import 'package:hodory/features/ReportsView/Presentaion/views/weekly_attendance_chart.dart';

class ReportsBody extends StatelessWidget {
  const ReportsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          spacing: 16,
          children: [
            const ReportsFilterSec(),
            // ReportEmptySec(),
            BlocBuilder<ReportCubit, ReportState>(
              builder: (context, state) {
                if (state is ReportSuccess) {
                  return const Column(
                    spacing: 16,

                    children: [
                      ReportAnalysis(),
                      WeeklyAttendanceChart(),
                      ReportAttendanceTable(),
                      ReportExportSec(),
                    ],
                  );
                } else if (state is ReportLoading) {
                  return const ReportLoadingSec();
                } else {
                  return const ReportEmptySec();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
// ReportAnalysisSec()