import 'package:flutter/material.dart';
import '../models/exam_model.dart';
import '../widgets/detail_title.dart';
import '../widgets/detail_data.dart';

class ExamDetailsPage extends StatelessWidget {
  const ExamDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final exam = ModalRoute.of(context)!.settings.arguments as Exam;

    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: Text('Распоред за испити - 203233'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            ExamDetailTitle(name: exam.name),
            const SizedBox(height: 30),
            ExamDetailData(exam: exam),
          ],
        ),
      ),
    );
  }
}