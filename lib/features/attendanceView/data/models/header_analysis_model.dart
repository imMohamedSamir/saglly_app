import 'package:flutter/material.dart';

class HeaderAnalysisModel {
  final String title;
  final int count;
  final Icon icon;
  final int? persentage;

  HeaderAnalysisModel({
    required this.title,
    required this.count,
    required this.icon,
    this.persentage,
  });
}
