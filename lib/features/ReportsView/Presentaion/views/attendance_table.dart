import 'package:flutter/material.dart';

class AttendanceTable extends StatelessWidget {
  const AttendanceTable({super.key});

  @override
  Widget build(BuildContext context) {
    final attendanceDetails = [
      {'date': 'Oct 22, 2023', 'present': 42, 'absent': 3, 'percent': 93.3},
      {'date': 'Oct 21, 2023', 'present': 41, 'absent': 4, 'percent': 91.1},
      {'date': 'Oct 20, 2023', 'present': 43, 'absent': 2, 'percent': 95.6},
      {'date': 'Oct 19, 2023', 'present': 40, 'absent': 5, 'percent': 88.9},
      {'date': 'Oct 18, 2023', 'present': 44, 'absent': 1, 'percent': 97.8},
    ];

    Color getColor(double percent) {
      if (percent >= 95.0) return Colors.green;
      if (percent < 90.0) return Colors.red;
      return Colors.blue;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0),
          child: Text(
            'Detailed Attendance',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              _buildHeaderRow(),
              const Divider(height: 1),
              ...attendanceDetails.asMap().entries.map((entry) {
                final index = entry.key;
                final data = entry.value;
                final bgColor = index % 2 == 0 ? Colors.white : Colors.grey.shade100;
                return Container(
                  color: bgColor,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(data['date'] as String),
                      Text('${data['present']}'),
                      Text('${data['absent']}'),
                      Text(
                        '${(data['percent'] as double).toStringAsFixed(1)}%',
                        style: TextStyle(color: getColor(data['percent'] as double)),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHeaderRow() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      color: Colors.grey.shade200,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Date', style: TextStyle(fontWeight: FontWeight.w600)),
          Text('Present', style: TextStyle(fontWeight: FontWeight.w600)),
          Text('Absent', style: TextStyle(fontWeight: FontWeight.w600)),
          Text('%', style: TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
