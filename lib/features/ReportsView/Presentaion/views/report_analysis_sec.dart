import 'dart:io';

import 'package:excel/excel.dart' as ex;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hodory/core/theming/text_styles.dart';
import 'package:hodory/features/ReportsView/Presentaion/views/chart_body.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:share_plus/share_plus.dart';

import 'report_attendance_table.dart';

class ReportAnalysisSec extends StatelessWidget {
  const ReportAnalysisSec({super.key});

  @override
  Widget build(BuildContext context) {
    final attendance = [
      {
        "date": "Oct 22, 2023",
        "present": 42,
        "absent": 3,
        "percentage": "93.3%",
      },
      {
        "date": "Oct 21, 2023",
        "present": 41,
        "absent": 4,
        "percentage": "91.1%",
      },
      {
        "date": "Oct 20, 2023",
        "present": 43,
        "absent": 2,
        "percentage": "95.6%",
      },
      {
        "date": "Oct 19, 2023",
        "present": 40,
        "absent": 5,
        "percentage": "88.9%",
      },
      {
        "date": "Oct 18, 2023",
        "present": 44,
        "absent": 1,
        "percentage": "97.8%",
      },
    ];

    Future<void> saveAndShareFile({
      required File originalFile,
      required String filename,
    }) async {
      final downloadsDir = Directory('/storage/emulated/0/Download');
      final newPath = '${downloadsDir.path}/$filename';

      final savedFile = await originalFile.copy(newPath);
      print('✅ File saved to: $newPath');

      await Share.shareXFiles([
        XFile(savedFile.path),
      ], text: 'Attendance Report');
    }

    /// Generates a PDF report of attendance and saves to Downloads + shares it
    Future<void> generatePdfReport({
      required List<Map<String, dynamic>> data,
    }) async {
      final pdf = pw.Document();

      pdf.addPage(
        pw.Page(
          build: (context) {
            return pw.Table.fromTextArray(
              headers: ['Date', 'Present', 'Absent', '%'],
              data:
                  data
                      .map(
                        (row) => [
                          row['date'],
                          row['present'].toString(),
                          row['absent'].toString(),
                          row['percentage'].toString(),
                        ],
                      )
                      .toList(),
            );
          },
        ),
      );

      final tempDir = await getTemporaryDirectory();
      final tempPath = '${tempDir.path}/attendance_report.pdf';
      final file = File(tempPath);
      await file.writeAsBytes(await pdf.save());

      await saveAndShareFile(
        originalFile: file,
        filename: 'attendance_report.pdf',
      );
    }

    /// Generates an Excel report of attendance and saves to Downloads + shares it
    Future<void> generateExcelReport({
      required List<Map<String, dynamic>> data,
    }) async {
      final excel = ex.Excel.createExcel();
      final sheet = excel['Attendance'];

      sheet.appendRow([
        ex.TextCellValue('Date'),
        ex.TextCellValue('Present'),
        ex.TextCellValue('Absent'),
        ex.TextCellValue('%'),
      ]);

      for (var row in data) {
        sheet.appendRow([
          ex.TextCellValue(row['date'].toString()),
          ex.IntCellValue(row['present']),
          ex.IntCellValue(row['absent']),
          ex.TextCellValue(row['percentage'].toString()),
        ]);
      }

      final fileBytes = excel.encode();
      final tempDir = await getTemporaryDirectory();
      final tempPath = '${tempDir.path}/attendance_report.xlsx';
      final file =
          File(tempPath)
            ..createSync(recursive: true)
            ..writeAsBytesSync(fileBytes!);

      await saveAndShareFile(
        originalFile: file,
        filename: 'attendance_report.xlsx',
      );
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Container(
            color: Colors.grey,
            height: 1,
            width: double.infinity,
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: 150.h,
          child: ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade200, width: 2),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  width: 150.w,
                  height: 100.h,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.person_outline),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Text(
                            '45',
                            style: AppTextStyles.medium20.copyWith(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: Text(
                                  'Total Students',
                                  maxLines: 2,
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),

                            Text(
                              '93.5%',
                              maxLines: 2,
                              style: TextStyle(overflow: TextOverflow.ellipsis),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.grey.shade100,
                foregroundColor: Colors.black,
                side: BorderSide.none,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () async {
                await generatePdfReport(data: attendance);
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () async {
                await generateExcelReport(data: attendance);
              },
              icon: const Icon(Icons.file_copy_outlined, size: 20),
              label: const Text('Export as Excel'),
            ),
          ],
        ),
        Text('Weekly attendance', style: AppTextStyles.medium16),
        const ChartBody(),
        const ReportAttendanceTable(),
      ],
    );
  }
}
