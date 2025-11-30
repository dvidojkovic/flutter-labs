import 'package:flutter/material.dart';
import 'package:flutter_application_labs1/models/models.dart';

class FavoritesProvider extends ChangeNotifier {
  final List<Meal> _favoriteMeals = [];

  List<Meal> get favoriteMeals => _favoriteMeals;

  void toggleFavorite(Meal meal) {
    if (_favoriteMeals.any((x) => x.idMeal == meal.idMeal)) {
      _favoriteMeals.removeWhere((x) => x.idMeal == meal.idMeal);
    } else {
      _favoriteMeals.add(meal);
    }
    notifyListeners();
  }

  bool isFavorite(String mealId) {
    return favoriteMeals.any((x) => x.idMeal == mealId);
  }
}
