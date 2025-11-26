import 'package:flutter/material.dart';
import '../models/models.dart';
import '../widgets/meal_card.dart';

class MealGridContent extends StatelessWidget {
  final List<Meal> meals;

  const MealGridContent({super.key, required this.meals});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 10,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          childAspectRatio: 200/244
        ),
        itemCount: meals.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return MealCard(meal: meals[index]);
        },
      );
  }
}
