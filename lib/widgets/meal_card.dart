import 'package:flutter/material.dart';
import 'package:flutter_application_labs1/services/favorites_provider.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';

class MealCard extends StatelessWidget {
  final Meal meal;

  const MealCard({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    final favorites = context.watch<FavoritesProvider>();
    
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/details", arguments: meal.idMeal);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.red.shade300, width: 3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 120,
                  child: Image.network(meal.strMealThumb, fit: BoxFit.cover),
                ),
                Divider(),
                Text(meal.strMeal, style: TextStyle(fontSize: 12)),
              ],
            ),
            Positioned(
              top: 8,
              right: 8,
              child: IconButton(
                icon: Icon(
                  favorites.isFavorite(meal.idMeal)
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Colors.red,
                ),
                onPressed: () {
                  favorites.toggleFavorite(meal);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
