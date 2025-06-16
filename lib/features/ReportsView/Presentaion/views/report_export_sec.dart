import 'package:flutter/material.dart';
import 'package:hodory/features/ReportsView/Presentaion/manager/cubit/report_cubit.dart';

class ReportExportSec extends StatelessWidget {
  const ReportExportSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.grey.shade100,
            foregroundColor: Colors.black,
            side: BorderSide.none,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () async {
            ReportCubit.get(context).generateAndSharePdf();
          },
          icon: const Icon(Icons.picture_as_pdf_rounded, size: 20),
          label: const Text('Export as PDF'),
        ),
        const SizedBox(width: 12),
        OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.grey.shade100,
            foregroundColor: Colors.black,
            side: BorderSide.none,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () async {
            ReportCubit.get(context).generateAndShareExcel();
          },
          icon: const Icon(Icons.file_copy_outlined, size: 20),
          label: const Text('Export as Excel'),
        ),
      ],
    );
  }
}
