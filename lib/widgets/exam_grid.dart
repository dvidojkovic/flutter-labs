import 'package:flutter/material.dart';
import '../models/exam_model.dart';
import 'exam_card.dart';

class ExamGrid extends StatelessWidget {
  final List<Exam> exams;

  const ExamGrid({super.key, required this.exams});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    int crossAxisCount;
    double aspectRatio;

    if (screenWidth < 600) {
      crossAxisCount = 4; // mobile: 2 cards per row
      aspectRatio = 1.5; // shorter cards
    } else if (screenWidth < 1200) {
      crossAxisCount = 4; // tablet/desktop: 4 cards per row
      aspectRatio = 1.9; // smaller and more compact
    } else {
      crossAxisCount = 4; // large desktop: 6 cards per row
      aspectRatio = 4;
    }

    return GridView.builder(
      padding: const EdgeInsets.all(8),
      physics: const BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: aspectRatio,
      ),
      itemCount: exams.length,
      itemBuilder: (context, index) {
        return ExamCard(exam: exams[index]);
      },
    );
  }
}