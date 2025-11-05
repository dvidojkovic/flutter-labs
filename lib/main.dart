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
      Exam(
        id: 5,
        name: 'Мобилни информациски системи',
        date: DateTime(2025, 10, 20),
        labs: ['Лаб 5'],
      ),
      Exam(
        id: 6,
        name: 'Софтверско инженерство',
        date: DateTime(2025, 10, 18),
        labs: ['Лаб 5'],
      ),
      Exam(
        id: 7,
        name: 'Управување со УИКТ проекти',
        date: DateTime(2025, 10, 15),
        labs: ['Лаб 5'],
      ),
      Exam(
        id: 8,
        name: 'Претприемништво',
        date: DateTime(2025, 10, 10),
        labs: ['Лаб 5'],
      ),
      Exam(
        id: 9,
        name: 'Вовед во наука за податоци',
        date: DateTime(2025, 09, 30),
        labs: ['Лаб 5'],
      ),
      Exam(
        id: 10,
        name: 'Напредно програмирање',
        date: DateTime(2025, 09, 20),
        labs: ['Лаб 5'],
      ),
      Exam(
        id: 11,
        name: 'Дигитизација',
        date: DateTime(2025, 10, 25),
        labs: ['Лаб 5'],
      ),
    ];

    exams.sort((a, b) => a.date.compareTo(b.date));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Распоред за испити - 203233'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          ExamGrid(exams: exams),

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
                'Вкупно испити: : ${exams.length}',
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
              ),
            )
          )
        ]
      )
    );
  }
}