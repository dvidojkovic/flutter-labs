import 'package:flutter/material.dart';
import '../models/exam_model.dart';
import 'exam_card.dart';

class ExamGrid extends StatelessWidget {
  final List<Exam> exams;

  const ExamGrid({super.key, required this.exams});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Dynamically pick number of columns based on screen width
    int crossAxisCount;
    double aspectRatio;

    if (screenWidth < 600) {
      // small screen (mobile)
      crossAxisCount = 2;
      aspectRatio = 0.8;
    } else if (screenWidth < 1200) {
      // medium (tablet)
      crossAxisCount = 3;
      aspectRatio = 1.1;
    } else {
      // large (desktop/web)
      crossAxisCount = 4;
      aspectRatio = 1.3;
    }

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: aspectRatio,
      ),
      itemCount: exams.length,
      padding: const EdgeInsets.all(12),
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return ExamCard(exam: exams[index]);
      },
    );
  }
}