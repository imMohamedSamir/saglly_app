import 'package:flutter/material.dart';
import 'package:hodory/features/HomeView/Presentaion/views/class_card.dart';

class ClassesListSec extends StatelessWidget {
  const ClassesListSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return const ClassCard();
        },
      ),
    );
  }
}
