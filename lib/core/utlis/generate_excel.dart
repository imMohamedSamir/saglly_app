import 'dart:io';

import 'package:excel/excel.dart' as ex;
import 'package:hodory/core/utlis/share_service.dart';
import 'package:hodory/features/attendanceView/data/models/attendance_model.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

Future<void> exportAttendanceToExcel(
  List<AttendanceModel> attendanceList,
) async {
  final excel = ex.Excel.createExcel();
  excel.delete('Sheet1'); // ✅ Remove the default empty sheet
  final sheet = excel['Attendance'];
  excel.setDefaultSheet('Attendance'); // ✅ Set your sheet as default

  // 1. Extract unique dates sorted
  final uniqueDates =
      attendanceList
          .map((e) => DateTime.parse(e.date!.split(' ').first))
          .toSet()
          .toList()
        ..sort((a, b) => a.compareTo(b)); // ascending

  final formattedDates =
      uniqueDates.map((d) => DateFormat('MMM dd, yyyy').format(d)).toList();

  // 2. Extract unique student names
  final uniqueStudents =
      attendanceList.map((e) => e.studentId).toSet().toList();

  // 3. Header row
  final header = [
    'Student Name',
    ...formattedDates,
    'Total Present',
    'Total Absent',
  ];
  sheet.appendRow(
    List.generate(header.length, (index) => ex.TextCellValue(header[index])),
  );

  // 4. Fill data for each student
  for (var studentId in uniqueStudents) {
    final studentRecords =
        attendanceList.where((e) => e.studentId == studentId).toList();
    final name = studentRecords.first.studentName ?? studentId;

    int presentCount = 0;
    int absentCount = 0;
    List<String> statuses = [];

    for (var date in uniqueDates) {
      final record = studentRecords.firstWhere(
        (e) => DateTime.parse(e.date!.split(' ').first) == date,
        orElse: () => AttendanceModel(status: '-'),
      );

      final status = record.status ?? '-';
      statuses.add(status);
      if (status == 'P') {
        presentCount++;
      } else {
        absentCount++;
      }
    }

    sheet.appendRow([
      ex.TextCellValue(name ?? ""),
      ...List.generate(
        statuses.length,
        (index) => ex.TextCellValue(statuses[index]),
      ),
      ex.TextCellValue(presentCount.toString()),
      ex.TextCellValue(absentCount.toString()),
    ]);
  }

  // 5. Save the file
  final dir = await getExternalStorageDirectory();
  final filePath = '${dir!.path}/attendance report.xlsx';
  final fileBytes = excel.encode();
  final file = File(filePath);
  await file.writeAsBytes(fileBytes!);
  ShareService.shareFile(file: file, filename: "attendance report");
}

Future<void> generateAttendancePdf({
  required List<AttendanceModel> attendanceList,
  // String className = "Grade 3A", // optional
}) async {
  final pdf = pw.Document();

  // 1. Extract unique dates and sort
  final uniqueDates =
      attendanceList
          .map((e) => DateTime.parse(e.date!.split(' ').first))
          .toSet()
          .toList()
        ..sort((a, b) => a.compareTo(b));

  final formattedDates =
      uniqueDates.map((d) => DateFormat('MMM dd, yyyy').format(d)).toList();

  // 2. Extract unique students by ID
  final uniqueStudentIds =
      attendanceList.map((e) => e.studentId).toSet().toList();

  // 3. Build headers
  final headers = ['Student Name', ...formattedDates, 'Total Present'];

  // 4. Build student attendance map
  final List<List<String>> dataRows = [];

  for (var studentId in uniqueStudentIds) {
    final studentRecords =
        attendanceList.where((e) => e.studentId == studentId).toList();
    final studentName = studentRecords.first.studentName ?? studentId;

    // Map date string => status
    final Map<String, String> attendanceMap = {};
    for (var record in studentRecords) {
      final dateKey = DateFormat(
        'MMM dd, yyyy',
      ).format(DateTime.parse(record.date!.split(' ').first));
      attendanceMap[dateKey] = record.status ?? '-';
    }

    int presentCount = attendanceMap.values.where((s) => s == 'P').length;

    dataRows.add([
      studentName ?? "",
      ...formattedDates.map((d) => attendanceMap[d] ?? '-'),
      presentCount.toString(),
    ]);
  }

  // 5. Add the PDF content
  pdf.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4.landscape,
      build:
          (context) => [
            // pw.Text(
            //   "Attendance Report - $className",
            //   style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
            // ),
            pw.SizedBox(height: 10),
            pw.TableHelper.fromTextArray(
              border: pw.TableBorder.all(width: 0.5),
              headers: headers,
              data: dataRows,
              headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              cellAlignment: pw.Alignment.center,
              headerDecoration: const pw.BoxDecoration(
                color: PdfColors.grey300,
              ),
              cellStyle: const pw.TextStyle(fontSize: 10),
            ),
          ],
    ),
  );

  // // 6. Preview or print the PDF
  // await Printing.layoutPdf(
  //   onLayout: (PdfPageFormat format) async => pdf.save(),
  //   outputType: OutputType.photo,
  //   format: PdfPageFormat.a4,
  // );
  // 6. Save PDF to file
  final dir = await getExternalStorageDirectory();
  final filePath = '${dir!.path}/attendance_report.pdf';
  final file = File(filePath);
  await file.writeAsBytes(await pdf.save());

  // 7. Share the file
  ShareService.shareFile(file: file, filename: "attendance_report.pdf");
}
