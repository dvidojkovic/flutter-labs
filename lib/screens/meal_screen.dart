import 'package:flutter/material.dart';
import 'package:flutter_application_labs1/widgets/meal_grid.dart';

class MealPage extends StatelessWidget {
  const MealPage({super.key});

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: MealGrid(category: category),
    );
  }
}