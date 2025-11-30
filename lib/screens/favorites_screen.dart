import 'package:flutter/material.dart';
import 'package:flutter_application_labs1/services/favorites_provider.dart';
import 'package:flutter_application_labs1/widgets/meal_card.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = Provider.of<FavoritesProvider>(context).favoriteMeals;
    return Scaffold(
      appBar: AppBar(title: Text("Favorites")),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: favorites.length,
        itemBuilder: (_, i) => MealCard(meal: favorites[i]),
      ),
    );
  }
}