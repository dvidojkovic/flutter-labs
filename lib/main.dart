import 'package:flutter/material.dart';
import 'package:flutter_application_labs1/screens/exam_details.dart';
import 'screens/exam_grid_screen.dart';

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
      initialRoute: '/',
      routes: {
        '/': (context) => const ExamGridScreen(),
        '/details': (context) => const ExamDetailsPage(),
      }
    );
  }
}