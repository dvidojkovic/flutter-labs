import 'package:flutter/material.dart';
import 'package:flutter_application_labs1/screens/details_screen.dart';
import 'package:flutter_application_labs1/screens/categories_screen.dart';
import 'package:flutter_application_labs1/screens/meal_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Лабораториска вежба',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const CategoriesPage(title: 'Categories App'),
        '/meals': (context) => MealPage(),
        '/details': (context) => const MealDetailPage(),
      },
    );
  }
}