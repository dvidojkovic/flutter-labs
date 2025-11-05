import 'package:flutter/material.dart';
import 'models/exam_model.dart';
import 'widgets/exam_grid.dart';

void main() {
  runApp(const ExamApp());
}

class ExamApp extends StatelessWidget {
  const ExamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Распоред за испити',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ExamHomePage(),
    );
  }
}

class ExamHomePage extends StatelessWidget {
  const ExamHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Your exam data
    final exams = [
      Exam(
        id: 1,
        name: 'Мобилни апликации',
        date: DateTime(2025, 11, 12),
        labs: ['Лаб 1', 'Лаб 2'],
      ),
      Exam(
        id: 2,
        name: 'Бази на податоци',
        date: DateTime(2025, 11, 15),
        labs: ['Ауд 1'],
      ),
      Exam(
        id: 3,
        name: 'Интернет технологии',
        date: DateTime(2025, 11, 18),
        labs: ['Лаб 3'],
      ),
      Exam(
        id: 4,
        name: 'Оперативни системи',
        date: DateTime(2025, 11, 20),
        labs: ['Лаб 5'],
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Распоред за испити - 203233'),
        centerTitle: true,
      ),
      body: ExamGrid(exams: exams),
    );
  }
}