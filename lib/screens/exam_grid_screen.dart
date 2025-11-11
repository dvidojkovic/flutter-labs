import 'package:flutter/material.dart';
import '../models/exam_model.dart';
import '../widgets/exam_grid.dart';

class ExamGridScreen extends StatefulWidget {
  const ExamGridScreen({super.key});

  @override
  State<ExamGridScreen> createState() => _ExamGridScreenState();
}

class _ExamGridScreenState extends State<ExamGridScreen> {
  // Example data for testing
  final exams = [
      Exam(
        id: 1,
        name: 'Мобилни апликации',
        date: DateTime(2025, 11, 12, 22, 15),
        labs: ['Лаб 1', 'Лаб 2'],
      ),
      Exam(
        id: 2,
        name: 'Бази на податоци',
        date: DateTime(2025, 11, 15, 9, 20),
        labs: ['Ауд 1'],
      ),
      Exam(
        id: 3,
        name: 'Интернет технологии',
        date: DateTime(2025, 11, 18, 20, 15),
        labs: ['Лаб 3'],
      ),
      Exam(
        id: 4,
        name: 'Оперативни системи',
        date: DateTime(2025, 11, 20, 23, 49),
        labs: ['Лаб 5'],
      ),
      Exam(
        id: 5,
        name: 'Мобилни информациски системи',
        date: DateTime(2025, 10, 20, 10, 8),
        labs: ['Лаб 5'],
      ),
      Exam(
        id: 6,
        name: 'Софтверско инженерство',
        date: DateTime(2025, 10, 18, 8, 5),
        labs: ['Лаб 5'],
      ),
      Exam(
        id: 7,
        name: 'Управување со УИКТ проекти',
        date: DateTime(2025, 10, 15, 12, 15),
        labs: ['Лаб 5'],
      ),
      Exam(
        id: 8,
        name: 'Претприемништво',
        date: DateTime(2025, 10, 10, 19, 39),
        labs: ['Лаб 5'],
      ),
      Exam(
        id: 9,
        name: 'Вовед во наука за податоци',
        date: DateTime(2025, 09, 30, 23, 59),
        labs: ['Лаб 5'],
      ),
      Exam(
        id: 10,
        name: 'Напредно програмирање',
        date: DateTime(2025, 09, 20, 12, 45),
        labs: ['Лаб 5'],
      ),
      Exam(
        id: 11,
        name: 'Дигитизација',
        date: DateTime(2025, 10, 25, 13, 49),
        labs: ['Лаб 5'],
      ),
    ];

  @override
  Widget build(BuildContext context) {
    // Sort exams chronologically
    final sortedExams = [...exams]..sort((a, b) => a.date.compareTo(b.date));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Распоред за испити - 203233'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          ExamGrid(exams: sortedExams),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  )
                ],
              ),
              child: Text(
                'Вкупно испити: ${exams.length}',
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
